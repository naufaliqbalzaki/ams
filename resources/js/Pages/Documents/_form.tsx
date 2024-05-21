import InputError from '@/Components/InputError'
import { Button } from '@/Components/ui/button'
import { Calendar } from '@/Components/ui/calendar'
import { Input } from '@/Components/ui/input'
import { Label } from '@/Components/ui/label'
import {
  Popover,
  PopoverContent,
  PopoverTrigger
} from '@/Components/ui/popover'
import {
  Select,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectTrigger,
  SelectValue
} from '@/Components/ui/select'
import { Textarea } from '@/Components/ui/textarea'
import { cn } from '@/lib/utils'
import { Document, Instance } from '@/types'
import { useForm } from '@inertiajs/react'
import { CalendarIcon } from '@radix-ui/react-icons'
import {
  ChangeEventHandler,
  FormEventHandler,
  useEffect
} from 'react'

export const DocumentForm = ({
  userId,
  docType,
  document,
  instances
}: {
  userId: number
  docType: string
  document?: Document
  instances: Instance[]
}) => {
  if (document) {
    if (document.issue_date) {
      document.issue_date = new Date(document.issue_date)
    }
    if (document.verification_date) {
      document.verification_date = new Date(
        document.verification_date
      )
    }
  }

  const { data, setData, post, processing, errors } = useForm(
    document || {
      user_id: userId,
      instance_id: '',
      doc_type: docType,
      number: '',
      issue_date: new Date(),
      verification_date: new Date(),
      subject: '',
      from: '',
      file: new File([], 'file'),
      phone: '',
      next_action: '',
      corrective_action: '',
      description: '',
      _method: 'post'
    }
  )

  const submit: FormEventHandler = (e) => {
    e.preventDefault()
    setData('doc_type', docType)
    if (document && document.id) {
      data._method = 'put'
      post(route('documents.update', document.id), {
        forceFormData: true
      })
    }
    if (!document) {
      data._method = 'post'
      console.log(data)
      const url = route('documents.store')
      console.log(url)
      post(route('documents.store'))
    }
  }
  useEffect(() => {
    if (document) {
      setData('instance_id', document.instance_id)
      setData('number', document.number)
      setData('doc_type', document.doc_type)
      setData('issue_date', document.issue_date)
      setData('verification_date', document.verification_date)
      setData('from', document.from)
      setData('subject', document.subject)
      setData('file', document.file)
      setData('phone', document.phone)
      setData('next_action', document.next_action)
      setData('corrective_action', document.corrective_action)
      setData('description', document.description)
    } else {
      setData('doc_type', docType)
    }
  }, [setData])
  const handleFileChange: ChangeEventHandler<HTMLInputElement> = (
    e
  ) => {
    if (e.target.files) {
      setData('file', e.target.files[0])
    }
  }
  return (
    <form onSubmit={submit}>
      <div>
        <Label htmlFor="instance_id">Dinas</Label>
        <Select
          value={data.instance_id}
          onValueChange={(val) => setData('instance_id', val)}
        >
          <SelectTrigger className="mt-2">
            <SelectValue placeholder="Pilih dinas" />
          </SelectTrigger>
          <SelectContent>
            <SelectGroup>
              {instances.map((instance) => (
                <SelectItem
                  key={instance.id}
                  value={instance.id!.toString()}
                >
                  {instance.name}
                </SelectItem>
              ))}
            </SelectGroup>
          </SelectContent>
        </Select>

        <InputError message={errors.instance_id} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="number">No.</Label>
        <Input
          id="number"
          type="text"
          name="number"
          value={data.number}
          className="block w-full mt-1"
          onChange={(e) => setData('number', e.target.value)}
        />

        <InputError message={errors.number} className="mt-2" />
      </div>

      <div className="flex items-center gap-4 mt-4">
        <Label htmlFor="issue_date">Tanggal Terbit</Label>
        <Popover>
          <PopoverTrigger asChild>
            <Button
              variant={'outline'}
              className={cn(
                'w-[280px] justify-start text-left font-normal',
                !data.issue_date && 'text-muted-foreground'
              )}
            >
              <CalendarIcon className="w-4 h-4 mr-2" />
              {data.issue_date ? (
                `${data.issue_date.toLocaleString([], {
                  year: 'numeric',
                  month: 'numeric',
                  day: 'numeric',
                  hour: '2-digit',
                  minute: '2-digit'
                })}`
              ) : (
                <span>Pilih tanggal terbit</span>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-auto p-0">
            <Calendar
              mode="single"
              selected={data.issue_date}
              onSelect={(issue_date) => {
                if (issue_date) {
                  setData('issue_date', issue_date)
                }
              }}
              initialFocus
            />{' '}
            <Input
              type="time"
              className="mt-2 bg-neutral-50 border leading-none border-neutral-300 text-neutral-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-neutral-700 dark:border-neutral-600 dark:placeholder-neutral-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 "
              value={data.issue_date.toLocaleTimeString([], {
                hourCycle: 'h23',
                hour: '2-digit',
                minute: '2-digit'
              })}
              onChange={(selectedTime) => {
                const currentTime = data.issue_date
                currentTime.setHours(
                  parseInt(selectedTime.target.value.split(':')[0]),
                  parseInt(selectedTime.target.value.split(':')[1]),
                  0
                )
                setData('issue_date', currentTime)
              }}
            />
          </PopoverContent>
        </Popover>

        <InputError message={errors.issue_date} className="mt-2" />
      </div>
      <div className="flex items-center gap-4 mt-4">
        <Label htmlFor="verification_date">Tanggal Verifikasi</Label>
        <Popover>
          <PopoverTrigger asChild>
            <Button
              variant={'outline'}
              className={cn(
                'w-[280px] justify-start text-left font-normal',
                !data.verification_date && 'text-muted-foreground'
              )}
            >
              <CalendarIcon className="w-4 h-4 mr-2" />
              {data.verification_date ? (
                `${data.verification_date.toLocaleString([], {
                  year: 'numeric',
                  month: 'numeric',
                  day: 'numeric',
                  hour: '2-digit',
                  minute: '2-digit'
                })}`
              ) : (
                <span>Pilih tanggal verifikasi</span>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-auto p-0">
            <Calendar
              mode="single"
              selected={data.verification_date}
              onSelect={(verification_date) => {
                if (verification_date) {
                  setData('verification_date', verification_date)
                }
              }}
              initialFocus
            />{' '}
            <Input
              type="time"
              className="mt-2 bg-neutral-50 border leading-none border-neutral-300 text-neutral-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-neutral-700 dark:border-neutral-600 dark:placeholder-neutral-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 "
              value={data.verification_date.toLocaleTimeString([], {
                hourCycle: 'h23',
                hour: '2-digit',
                minute: '2-digit'
              })}
              onChange={(selectedTime) => {
                const currentTime = data.verification_date
                currentTime.setHours(
                  parseInt(selectedTime.target.value.split(':')[0]),
                  parseInt(selectedTime.target.value.split(':')[1]),
                  0
                )
                setData('verification_date', currentTime)
              }}
            />
          </PopoverContent>
        </Popover>

        <InputError
          message={errors.verification_date}
          className="mt-2"
        />
      </div>
      <div className="mt-4">
        <Label htmlFor="from">Pemohon</Label>
        <Input
          id="from"
          type="text"
          name="from"
          value={data.from}
          className="block w-full mt-1"
          onChange={(e) => setData('from', e.target.value)}
        />

        <InputError message={errors.from} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="subject">Perizinan</Label>
        <Textarea
          id="subject"
          name="subject"
          value={data.subject}
          className="block w-full mt-1"
          onChange={(e) => setData('subject', e.target.value)}
        />

        <InputError message={errors.subject} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="file">Lampiran</Label>
        <Input
          id="file"
          type="file"
          name="file"
          className="block w-full mt-1 file:text-foreground"
          accept="application/*"
          onChange={handleFileChange}
        />

        <InputError message={errors.file} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="phone">No. Telp</Label>
        <Input
          id="phone"
          type="text"
          name="phone"
          value={data.phone}
          className="block w-full mt-1"
          onChange={(e) => setData('phone', e.target.value)}
        />

        <InputError message={errors.phone} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="next_action">Aksi Lanjutan</Label>
        <Textarea
          id="next_action"
          name="next_action"
          value={data.next_action}
          className="block w-full mt-1"
          onChange={(e) => setData('next_action', e.target.value)}
        />

        <InputError message={errors.next_action} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="corrective_action">Aksi Koreksi</Label>
        <Textarea
          id="corrective_action"
          name="corrective_action"
          value={data.corrective_action}
          className="block w-full mt-1"
          onChange={(e) =>
            setData('corrective_action', e.target.value)
          }
        />

        <InputError
          message={errors.corrective_action}
          className="mt-2"
        />
      </div>
      <div className="mt-4">
        <Label htmlFor="description">Keterangan</Label>
        <Textarea
          id="description"
          name="description"
          value={data.description}
          className="block w-full mt-1"
          onChange={(e) => setData('description', e.target.value)}
        />

        <InputError message={errors.description} className="mt-2" />
      </div>
      <div className="flex items-center justify-between mt-4">
        <Button
          type="submit"
          className="w-full mt-2"
          disabled={processing}
        >
          {document ? 'Ubah' : 'Buat'}
        </Button>
      </div>
    </form>
  )
}
