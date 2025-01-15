deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

DISABLE_SECURE_BOOT = 'Make sure Secure Boot is disabled in BIOS.'
GENERIC_FLASH = '''
	Please make sure you do not have any other USB keys inserted.
	Power up the hardware. Make sure you have a keyboard connected.
	Press the F10 key (may differ on some platforms) while BIOS is loading in order to enter the boot menu.
	Next, select the name of your USB key.
'''

GENERIC_POWERON = 'Power on your device.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	GENERIC_POWERON
]

module.exports =
	version: 1
	slug: 'generic-amd64'
	aliases: [ 'generic-amd64' ]
	name: 'Generic x86_64 (GPT)'
	arch: 'amd64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_USB
		instructions.EJECT_USB
		instructions.FLASHER_WARNING
		DISABLE_SECURE_BOOT
		GENERIC_FLASH
	].concat(postProvisioningInstructions)

	yocto:
		machine: 'generic-amd64'
		image: 'uinta-image-flasher'
		fstype: 'uintaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'uinta-image-flasher-generic-amd64.uintaos-img'
		deployFlasherArtifact: 'uinta-image-flasher-generic-amd64.uintaos-img'
		deployRawArtifact: 'uinta-image-generic-amd64.uintaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	options: [ networkOptions.group ]

	initialization: commonImg.initialization
