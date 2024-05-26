import InputError from '@/Components/InputError'
import { Button } from '@/Components/ui/button'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import { PageProps } from '@/types'
import { useForm, usePage } from '@inertiajs/react'
import { FormEventHandler, useEffect, useRef } from 'react'
import { toast } from 'sonner'

export default function UpdatePasswordForm({
  className = ''
}: {
  className?: string
}) {
  const flash = usePage<PageProps>().props.flash

  useEffect(() => {
    toast.dismiss()
    if (flash?.success) {
      toast.success(flash.success)
    }

    if (flash?.error) {
      toast.error(flash.error)
    }
  }, [flash])

  const passwordInput = useRef<HTMLInputElement>(null)
  const currentPasswordInput = useRef<HTMLInputElement>(null)

  const {
    data,
    setData,
    errors,
    put,
    reset,
    processing,
    recentlySuccessful
  } = useForm({
    current_password: '',
    password: '',
    password_confirmation: ''
  })

  const updatePassword: FormEventHandler = (e) => {
    e.preventDefault()

    put(route('password.update'), {
      preserveScroll: true,
      onSuccess: () => reset(),
      onError: (errors) => {
        if (errors.password) {
          reset('password', 'password_confirmation')
          passwordInput.current?.focus()
        }

        if (errors.current_password) {
          reset('current_password')
          currentPasswordInput.current?.focus()
        }
      }
    })
  }

  return (
    <section className={className}>
      <header>
        <h2 className="text-lg font-medium text-gray-900 dark:text-gray-100">
          Ubah Kata Sandi
        </h2>

        <p className="mt-1 text-sm text-gray-600 dark:text-gray-400">
          Pastikan kata sandi Anda aman.
        </p>
      </header>

      <form
        onSubmit={updatePassword}
        className="h-full mt-6 space-y-6"
      >
        <div>
          <Label htmlFor="current_password">
            Kata Sandi Saat Ini
          </Label>

          <Input
            id="current_password"
            ref={currentPasswordInput}
            value={data.current_password}
            onChange={(e) =>
              setData('current_password', e.target.value)
            }
            type="password"
            className="block w-full mt-1"
            autoComplete="current-password"
          />

          <InputError
            message={errors.current_password}
            className="mt-2"
          />
        </div>

        <div>
          <Label htmlFor="password">Kata Sandi Baru</Label>

          <Input
            id="password"
            ref={passwordInput}
            value={data.password}
            onChange={(e) => setData('password', e.target.value)}
            type="password"
            className="block w-full mt-1"
            autoComplete="new-password"
          />

          <InputError message={errors.password} className="mt-2" />
        </div>

        <div>
          <Label htmlFor="password_confirmation">
            Konfirmasi Kata Sandi Baru
          </Label>

          <Input
            id="password_confirmation"
            value={data.password_confirmation}
            onChange={(e) =>
              setData('password_confirmation', e.target.value)
            }
            type="password"
            className="block w-full mt-1"
            autoComplete="new-password"
          />

          <InputError
            message={errors.password_confirmation}
            className="mt-2"
          />
        </div>

        <div className="flex items-center gap-4">
          <Button
            disabled={processing}
            className="absolute bottom-0 w-full"
          >
            Simpan
          </Button>
        </div>
      </form>
    </section>
  )
}
