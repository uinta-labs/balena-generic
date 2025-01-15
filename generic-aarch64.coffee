deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'generic-aarch64'
	name: 'Generic AARCH64 (ARMv8)'
	arch: 'aarch64'
	state: 'new'

	instructions: commonImg.instructions
	supportsBlink: false

	yocto:
		machine: 'generic-aarch64'
		image: 'uinta-image'
		fstype: 'uintaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'uinta-image-generic-aarch64.uintaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
