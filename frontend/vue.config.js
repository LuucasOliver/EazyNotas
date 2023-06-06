const { defineConfig } = require('@vue/cli-service')
const path = require('path')
module.exports = defineConfig({
  transpileDependencies: true,
  configureWebpack: {
    resolve: {
      alias: {
        '@': path.resolve(__dirname, 'src'),
        '@images': path.resolve(__dirname, 'src/assets/img'),
        '@api': path.resolve(__dirname, 'src/api')
      },
      extensions: ['', '.js', '.vue']
    }
  }
})
