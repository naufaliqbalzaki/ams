import{j as e,Y as n}from"./app-Cq7G-fns.js";import{D as c,a}from"./DataTableColumnHeader-CG8ApcrE.js";import{B as o}from"./button-DA6EFk0Z.js";import{A as m}from"./AuthenticatedLayout-Bp_fWaqo.js";import{D as d}from"./index-BaoucwQB.js";import"./popover-DeUa9yeW.js";import"./index-BbjS5omJ.js";import"./index-BlY-2Gi1.js";import"./input-Bfv9INNM.js";import"./alert-dialog-zleDPHtu.js";function D({auth:r,subjects:s}){console.log(s);const i=[{accessorKey:"subject",meta:"Perizinan",header:({column:t})=>e.jsx(a,{column:t,title:"Perizinan"})},{accessorKey:"verification_date",meta:"Tanggal Verifikasi",header:"",filterFn:"dateRangeFilter",cell(t){const l=new Date(t.getValue());return console.log(l),null}},{accessorKey:"approved_total",meta:"Disetujui",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Disetujui"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}},{accessorKey:"corrective_total",meta:"Dikembalikan",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Dikembalikan"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}},{accessorKey:"total",meta:"Total",header:({column:t})=>e.jsx("div",{className:"flex items-center justify-center gap-2 ml-4",children:e.jsx(a,{column:t,title:"Total"})}),cell(t){return e.jsx("div",{className:"flex items-center justify-center gap-2",children:t.getValue()})}}];return e.jsxs(m,{user:r.user,header:e.jsxs("div",{className:"flex items-center justify-between gap-2",children:[e.jsx("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:"Laporan"}),e.jsx("div",{className:"flex items-center gap-2",children:e.jsx("a",{href:route("reports.download"),children:e.jsxs(o,{type:"button",children:[e.jsx(d,{className:"w-5 h-5"}),"Unduh"]})})})]}),children:[e.jsx(n,{title:"Laporan"}),e.jsx("div",{className:"px-8 pb-8 mx-auto max-w-[1728px]",children:e.jsx(c,{columns:i,data:s,name:"reports",searchParam:"subject",pageSizeOptions:[50,100,200,500]})})]})}export{D as default};
