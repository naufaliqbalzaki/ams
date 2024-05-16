import {
  Card,
  CardContent,
  CardHeader,
  CardTitle
} from '@/Components/ui/card'
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout'
import { PageProps } from '@/types'
import { Head } from '@inertiajs/react'
import {
  FileIcon,
  FileTextIcon,
  SketchLogoIcon
} from '@radix-ui/react-icons'
import ReactApexChart, {
  Props as ApexChartsProps
} from 'react-apexcharts'
const meta: Record<string, any> = {
  doc_central: {
    icon: <FileTextIcon className="w-4 h-4 text-muted-foreground" />
  },
  doc_east: {
    icon: <FileIcon className="w-4 h-4 text-muted-foreground" />
  },
  instance_active: {
    icon: <SketchLogoIcon className="w-4 h-4 text-muted-foreground" />
  },
  instance_inactive: {
    icon: <SketchLogoIcon className="w-4 h-4 text-muted-foreground" />
  }
}

function randomColor() {
  return [
    `#${Math.floor(Math.random() * 16777215).toString(16)}`,
    `#${Math.floor(Math.random() * 16777215).toString(16)}`,
    `#${Math.floor(Math.random() * 16777215).toString(16)}`
  ]
}

function generateChart({ data }: { data: any }) {
  let dates: any = []
  let groupedData: any = {}
  data.data.forEach((item: any) => {
    const dateOnly = item.created_at.split('T')[0]

    if (!dates.includes(dateOnly)) {
      dates.push(dateOnly)
    }

    if (!groupedData[dateOnly]) {
      groupedData[dateOnly] = []
    }
    groupedData[dateOnly].push(item)
  })

  const chartData: ApexChartsProps = {
    type: 'area',
    series: [
      {
        name: `series2`,
        data: Object.keys(groupedData).map((key) => {
          return {
            x: new Date(key).getTime(),
            y: groupedData[key].length
          }
        })
      }
    ],
    toolbar: {
      show: false
    },
    options: {
      chart: {
        height: 200,
        type: 'area',
        toolbar: {
          show: false
        }
      },
      colors: randomColor(),
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'smooth'
      },
      xaxis: {
        type: 'datetime',
        categories: dates
      },
      tooltip: {
        x: {
          format: 'dd/MM/yy HH:mm'
        }
      }
    }
  }

  return (
    <>
      <ReactApexChart
        options={chartData.options}
        series={chartData.series}
        type="area"
        height={200}
      />
    </>
  )
}
export default function Dashboard({
  auth,
  data
}: PageProps & {
  data: any
}) {
  const keys = Object.keys(data)
  return (
    <AuthenticatedLayout
      user={auth.user}
      header={
        <h2 className="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
          Dashboard
        </h2>
      }
    >
      <Head title="Dashboard" />

      <div className="px-8 mx-auto max-w-7xl">
        <div className="grid grid-cols-1 gap-2 transition-all duration-300 ease-in-out md:grid-cols-2">
          {keys.map((key) => (
            <Card key={key}>
              <CardHeader className="flex flex-row items-center justify-between space-y-0">
                <CardTitle className="text-sm font-medium">
                  {data[key].name}
                </CardTitle>
                {meta[key]?.icon && <>{meta[key].icon}</>}
              </CardHeader>
              <CardContent className="text-2xl font-semibold">
                {generateChart({ data: data[key] })}
                <h3 className="font-semibold ">
                  {data[key].data.length}
                  <span className="ml-2 font-normal text-gray-500 ">
                    {data[key].unit}
                  </span>
                </h3>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </AuthenticatedLayout>
  )
}
