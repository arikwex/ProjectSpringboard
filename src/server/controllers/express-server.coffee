express = require('express')
app = express()

allowCrossDomain = (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
  next()
  return

# Configure middleware
app.use(allowCrossDomain)
app.use('/static', express.static('dist'))

# Configure view engine
app.set('views', './src/server/views')
app.set('view engine', 'pug')

app.get('/', (req, res) ->
  return res.render('index')
)

console.log('Starting express server...')
app.listen(3000)