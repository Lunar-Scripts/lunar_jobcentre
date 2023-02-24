1. Install all of the dependencies and start them before the script: ESX Legacy, ox_lib, ox_inventory, esx_license.

2. Install the required interior: verpi_jobcentre

3. Configure the script to your likings.

4. Add this ox_inventory/data/items.lua

    ['id_card'] = {
		label = 'ID card',
	},

	['license_drive'] = {
		label = 'Driving license',
	},

	['license_weapon'] = {
		label = 'Weapon license',
	},