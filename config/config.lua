Config = {}
Config.RenderDistance = 30.0
Config.Target = 'ox_target' --['ox_target'/'qtarget']

Config.Blip = {
	Text = 'Job Centre',
	Sprite = 498,
	Size = 1.0,
	Color = 26,
	Display = 4
}

Config.Locations = {
	{
		Ped = `a_f_y_business_01`,
		Coords = vector4(-234.9988, -922.2012, 32.3123, 338.4116),
	}
}

--Optional fontawesome icons for jobs.
Config.JobIcons = {
	['unemployed'] = 'fa-solid fa-user',
	['taxi'] = 'fa-solid fa-taxi',
	['trucker'] = 'fa-solid fa-truck',
}

Config.Licenses = {
	{
		Item = 'id_card',
		Label = 'ID card',
		Icon = 'fa-solid fa-id-card',
		LicenseNeeded = false, --['license'/false] verify license ownership through esx_license
		Price = 100
	},
	{
		Item = 'license_drive',
		Label = 'Driving license',
		Icon = 'fa-solid fa-car',
		LicenseNeeded = 'dmv', --['license'/false] verify license ownership through esx_license
		Price = 100
	},
	{
		Item = 'license_weapon',
		Label = 'Weapon license',
		Icon = 'fa-solid fa-gun',
		LicenseNeeded = 'weapon', --['license'/false] verify license ownership through esx_license
		Price = 100
	},
}
