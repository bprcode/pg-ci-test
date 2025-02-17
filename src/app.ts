import dotenv from 'dotenv'
dotenv.config({ path: '../.lite-secrets/pg-ci/.env' })
import express, { Request, Response } from 'express'
import 'express-async-errors'
import pg from 'pg'
const app = express()

app

  .get('/', (req: Request, res: Response) => {
    res.send('Status OK')
  })

  .get('/time', async (req: Request, res: Response) => {
    // const client = new pg.Client()
    const client = new pg.Client()

    await client.connect()
    const result = await client.query('SELECT NOW()')
    console.log('Now() query result:', result)

    await client.end()

    res.json(result.rows)
  })

  .get('/test-query', async (req: Request, res: Response) => {
    const client = new pg.Client()

    await client.connect()
    const result = await client.query('SELECT * FROM fruits')
    console.log('Got result:', result)

    await client.end()

    res.json(result.rows)
  })

  .use((err: Error, req: Request, res: Response, next: Function) => {
    console.log('🛑 Error encountered:', err)
    res.status(500).send('⚠️ Server error: ' + err.message)
  })

let server = app.listen(3000, () => {
  const address = server.address()
  if (!address || typeof address === 'string') {
    console.log('Unfamiliar address type:', address)
    return
  }

  console.log(
    '🦆 Server up: \u001b[36mhttp://localhost:' + address.port + '\u001b[37m'
  )
  const keys = ['SAMPLE_KEY', 'POSTGRES_HOST', 'PGHOST', 'PGPORT', 'PGUSER']
  for (const key of keys) {
    console.log(key, ':', process.env[key])
  }
})
