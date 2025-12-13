require('preconfig')
require('base')

require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  },
})

require('config')
require('keys')
