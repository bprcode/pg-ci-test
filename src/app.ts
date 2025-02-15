import express, { Request, Response } from 'express'
const app = express()

app.get('/', (req: Request, res: Response) => {
  res.send('Status OK')
})

let server = app.listen(3000, () => {
  const address = server.address() as unknown as { port: string }
  console.log(
    '🦆 Server up: \u001b[36mhttp://localhost:' + address.port + '\u001b[37m'
  )
})
