import dotenv from 'dotenv'
dotenv.config({ path: '../.lite-secrets/pg-ci/.env'})
import express, { Request, Response } from 'express'
import 'express-async-errors'
import pg from 'pg'
const app = express()

app
  .get('/', (req: Request, res: Response) => {
    res.send('NOT Status OK')
  })
  .get('/test-query', async (req:Request, res:Response) => {
    const client = new pg.Client()

    await client.connect()
    const result = await client.query('SELECT NOW()')
    console.log('Got NOW() result:', result)

    await client.end()
  })
  .use((err: Error, req:Request, res:Response, next:Function) => {
    console.log('ERROR HANDLER:', err)
    res.status(500).send('⚠️ Server error: ' + err.message)

  })

let server = app.listen(3000, () => {
  const address = server.address() as unknown as { port: string }
  console.log(
    '🦆 Server up: \u001b[36mhttp://localhost:' + address.port + '\u001b[37m'
  )
  console.log('Environment check:', process.env.SAMPLE_KEY)
})
