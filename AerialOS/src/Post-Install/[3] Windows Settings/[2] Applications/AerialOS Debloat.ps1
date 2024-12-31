# Load required assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create Form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "AerialOS Debloat"
$Form.Size = New-Object System.Drawing.Size(1000, 600)
$Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Form.BackColor = 'White'

# Create DataGridView
$DataGridView = New-Object System.Windows.Forms.DataGridView
$DataGridView.Location = New-Object System.Drawing.Point(10, 40)
$DataGridView.Size = New-Object System.Drawing.Size(960, 470)
$DataGridView.Anchor = [System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right
$DataGridView.AutoSizeColumnsMode = [System.Windows.Forms.DataGridViewAutoSizeColumnsMode]::Fill
$DataGridView.ColumnHeadersHeightSizeMode = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::AutoSize
$DataGridView.SelectionMode = [System.Windows.Forms.DataGridViewSelectionMode]::FullRowSelect
$DataGridView.MultiSelect = $true
$DataGridView.BackgroundColor = 'White'
$DataGridView.AllowUserToAddRows = $false

# Add Columns to DataGridView
$UninstallColumn = New-Object System.Windows.Forms.DataGridViewCheckBoxColumn
$UninstallColumn.Name = "Uninstall"
$UninstallColumn.HeaderText = "Uninstall"
$DataGridView.Columns.Add($UninstallColumn) | Out-Null
$DataGridView.Columns.Add("Package Name", "Package Name") | Out-Null
$DataGridView.Columns.Add("Package Full Name", "Package Full Name") | Out-Null
$DataGridView.Columns.Add("Required For", "Required For") | Out-Null
$DataGridView.Columns.Add("Non Removable", "Non Removable") | Out-Null
$DataGridView.Columns.Add("Framework", "Framework") | Out-Null

# Create ToolTip
$ToolTip = New-Object System.Windows.Forms.ToolTip

# Add ToolTips to DataGridView column headers
$DataGridView.Columns["Uninstall"].HeaderCell.ToolTipText = "Check this to mark the package for uninstallation."
$DataGridView.Columns["Package Name"].HeaderCell.ToolTipText = "This is the name of the application package."
$DataGridView.Columns["Package Full Name"].HeaderCell.ToolTipText = "This is the full name of the application package, which includes the package name, version, and other information."
$DataGridView.Columns["Required For"].HeaderCell.ToolTipText = "This column displays the dependencies of the package. Dependencies are other packages that this package needs in order to function."
$DataGridView.Columns["Non Removable"].HeaderCell.ToolTipText = "This column indicates whether the package can be removed. If the value in this column is True, it means the package cannot be removed."
$DataGridView.Columns["Framework"].HeaderCell.ToolTipText = "This column indicates whether the package is a framework. Frameworks are packages that typically provide functionality used by other apps, and they are usually not intended to be run directly by the user."

$Form.Controls.Add($DataGridView)

# Create TextBox for search
$SearchBox = New-Object System.Windows.Forms.TextBox
$SearchBox.Location = New-Object System.Drawing.Point(10, 10)
$SearchBox.Size = New-Object System.Drawing.Size(200, 20)
$SearchBox.Add_KeyDown({
    param($sender, $e)
    if ($e.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        $SearchButton.PerformClick()
    }
})
$Form.Controls.Add($SearchBox)

# Create Search Button
$SearchButton = New-Object System.Windows.Forms.Button
$SearchButton.Location = New-Object System.Drawing.Point(220, 10)
$SearchButton.Size = New-Object System.Drawing.Size(100, 20)
$SearchButton.Text = "Search"
$SearchButton.BackColor = 'LightGray'
$SearchButton.Add_Click({
    $searchText = $SearchBox.Text.ToLower()
    foreach ($row in $DataGridView.Rows) {
        $packageName = $row.Cells["Package Name"].Value.ToString().ToLower()
        if ($packageName -like "*$searchText*") {
            $row.Visible = $true
        } else {
            $row.Visible = $false
        }
    }
})
$Form.Controls.Add($SearchButton)

# Create Uninstall Button
$UninstallButton = New-Object System.Windows.Forms.Button
$UninstallButton.Location = New-Object System.Drawing.Point(10, 520)
$UninstallButton.Size = New-Object System.Drawing.Size(200, 30)
$UninstallButton.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left
$UninstallButton.Text = "Uninstall Selected Packages"
$UninstallButton.BackColor = 'LightGray'
$UninstallButton.Add_Click({
    $selectedApps = @()
    $rowsToRemove = @()
    foreach ($row in $DataGridView.Rows) {
        if ($row.Cells["Uninstall"].Value -eq $true) {
            $selectedApps += $row.Cells["Package Name"].Value
            $rowsToRemove += $row
        }
    }
    if ($selectedApps.Count -gt 0) {
        Show-ConfirmationDialog $selectedApps $rowsToRemove
    }
})
$Form.Controls.Add($UninstallButton)

# Function to show confirmation dialog
function Show-ConfirmationDialog($selectedApps, $rowsToRemove) {
    $ConfirmationDialog = New-Object System.Windows.Forms.Form
    $ConfirmationDialog.AutoSize = $true
    $ConfirmationDialog.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
    $ConfirmationDialog.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
    $ConfirmationDialog.Text = "Confirmation"
    $ConfirmationDialog.ControlBox = $true
    $ConfirmationDialog.BackColor = 'White'
    $ConfirmationDialog.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $ConfirmationDialog.MaximizeBox = $false
    $ConfirmationDialog.MinimizeBox = $false

    # Create a Panel to hold the Label and add scroll bars
    $Panel = New-Object System.Windows.Forms.Panel
    $Panel.Location = New-Object System.Drawing.Point(10, 10)
    $Panel.Size = New-Object System.Drawing.Size(280, 80)
    $Panel.AutoScroll = $true

    # Add label
    $Label = New-Object System.Windows.Forms.Label
    $Label.AutoSize = $true
    $Label.Text = "Are you sure you want to uninstall the following apps:`n`n" + ($selectedApps -join "`n")
    $Panel.Controls.Add($Label)

    $ConfirmationDialog.Controls.Add($Panel)

    # Add Yes button
    $YesButton = New-Object System.Windows.Forms.Button
    $YesButton.Text = "Yes"
    $YesButton.Location = New-Object System.Drawing.Point(10, 90)
    $YesButton.BackColor = 'LightGray'
    $YesButton.Add_Click({
        foreach ($appName in $selectedApps) {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-Command Get-AppxPackage -Name '$appName' | Remove-AppxPackage" -Wait
        }
        foreach ($row in $rowsToRemove) {
            $DataGridView.Rows.Remove($row)
        }
        $ConfirmationDialog.Close()
    })
    $ConfirmationDialog.Controls.Add($YesButton)

    # Add No button
    $NoButton = New-Object System.Windows.Forms.Button
    $NoButton.Text = "No"
    $NoButton.Location = New-Object System.Drawing.Point(110, 90)
    $NoButton.BackColor = 'LightGray'
    $NoButton.Add_Click({
        $ConfirmationDialog.Close()
    })
    $ConfirmationDialog.Controls.Add($NoButton)

    $ConfirmationDialog.ShowDialog()
}

# Create Refresh List Button
$RefreshButton = New-Object System.Windows.Forms.Button
$RefreshButton.Location = New-Object System.Drawing.Point(220, 520)
$RefreshButton.Size = New-Object System.Drawing.Size(200, 30)
$RefreshButton.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Left
$RefreshButton.Text = "Refresh List"
$RefreshButton.BackColor = 'LightGray'
$RefreshButton.Add_Click({
    Refresh-AppList
})
$Form.Controls.Add($RefreshButton)

# Function to fetch Appx Packages and populate DataGridView
function Refresh-AppList {
    $DataGridView.Rows.Clear()
    $apps = Get-AppxPackage | Select Name, PackageFullName, IsFramework, NonRemovable, Dependencies
    foreach ($app in $apps) {
        $row = $DataGridView.Rows.Add()
        $DataGridView.Rows[$row].Cells["Uninstall"].Value = $false
        $DataGridView.Rows[$row].Cells["Package Name"].Value = $app.Name
        $DataGridView.Rows[$row].Cells["Package Full Name"].Value = $app.PackageFullName
        $DataGridView.Rows[$row].Cells["Required For"].Value = $app.Dependencies
        $DataGridView.Rows[$row].Cells["Non Removable"].Value = $app.NonRemovable
        $DataGridView.Rows[$row].Cells["Framework"].Value = $app.IsFramework
    }
}

# Initial population of DataGridView
Refresh-AppList

# Show Form
$Form.ShowDialog()
