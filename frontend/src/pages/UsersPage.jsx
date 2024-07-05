import React from 'react'
import { useActionsUsers } from '../hooks'

export const UsersPage = () => {

  const { makeGetUsers } = useActionsUsers()

  // makeGetUsers()

  return (
    <button onClick={() => makeGetUsers()} >Obtener usuarios</button>
  )
}
