const generator = require('mini-book-site-generator')
const antoraArgs = ['--playbook', 'site.yml']

;(async () => {
  await generator(antoraArgs, process.env)
})()
