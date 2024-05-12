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
import { ChangeEventHandler, FormEventHandler } from 'react'

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
      type: 'incoming',
      number: '',
      issue_date: new Date(),
      verification_date: new Date(),
      subject: '',
      from: '',
      to: '',
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
        <Label htmlFor="instance_id">Instance</Label>
        <Select
          value={data.instance_id}
          onValueChange={(val) => setData('instance_id', val)}
        >
          <SelectTrigger className="mt-2">
            <SelectValue placeholder="Select instance" />
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
      <div>
        <Label htmlFor="type">Type</Label>
        <Select
          value={data.type}
          onValueChange={(val) => setData('type', val)}
        >
          <SelectTrigger className="mt-2">
            <SelectValue placeholder="Select document type" />
          </SelectTrigger>
          <SelectContent>
            <SelectGroup>
              <SelectItem value="incoming">Incoming</SelectItem>
              <SelectItem value="outgoing">Outgoing</SelectItem>
            </SelectGroup>
          </SelectContent>
        </Select>

        <InputError message={errors.type} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="number">Number</Label>
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
        <Label htmlFor="issue_date">Issue Date</Label>
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
                <span>Pick a issue date</span>
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
        <Label htmlFor="verification_date">Verification Date</Label>
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
                <span>Pick a verification date</span>
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
        <Label htmlFor="from">From</Label>
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
        <Label htmlFor="to">To</Label>
        <Input
          id="to"
          type="text"
          name="to"
          value={data.to}
          className="block w-full mt-1"
          onChange={(e) => setData('to', e.target.value)}
        />

        <InputError message={errors.to} className="mt-2" />
      </div>
      <div className="mt-4">
        <Label htmlFor="subject">Subject</Label>
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
        <Label htmlFor="file">Attachment</Label>
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
        <Label htmlFor="phone">Phone</Label>
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
        <Label htmlFor="next_action">Next Action</Label>
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
        <Label htmlFor="corrective_action">Corrective Action</Label>
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
        <Label htmlFor="description">Description</Label>
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
          {document ? 'Update' : 'Create'}
        </Button>
      </div>
    </form>
  )
}
