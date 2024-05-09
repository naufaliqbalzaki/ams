import { Config } from 'ziggy-js'

export interface User {
  id: number
  name: string
  email: string
  email_verified_at: string
}

export type PageProps<
  T extends Record<string, unknown> = Record<string, unknown>
> = T & {
  appName: string
  appUrl: string
  auth: {
    user: User
  }
  ziggy: Config & { location: string }
  flash?: {
    success?: string
    error?: string
  }
}

export interface Document {
  id: number
  user_id: number
  instance_id: number
  doc_type: string
  type: string
  number: string
  date: string
  subject: string
  from: string
  to: string
  file: string
  phone: string
  next_action: string
  corrective_action: string
  description: string
  created_at: string
  updated_at: string
}

export type Instance = {
  id: number | null
  parent_id: number | null
  name: string
  is_active: boolean
  kepsek: string
  website: string
  email: string
  image?: File | null
  address: string
  district: string
  city: string
  province: string
  postal_code: string
  created_at: string
  updated_at: string
  _method?: 'post' | 'put'
}
