import{r as l,A as r,j as t,y as m,Y as d}from"./app--bgrqt_F.js";import{D as x}from"./DataTable-BLtPdpEV.js";import{C as c,D as g}from"./checkbox-BLXWRiTg.js";import{B as n}from"./button-dMpf8Pr_.js";import{A as p}from"./AuthenticatedLayout-C1MLDTbs.js";import{P as u,f as j}from"./index-D3RA4NCA.js";import"./popover-DpPjz-OC.js";import"./index-Dcm7KLzm.js";import"./index-CVAeVBQm.js";import"./input-BA5B8DjG.js";import"./alert-dialog-B4WTZWnA.js";import"./separator-DumsmQ8_.js";function h({appUrl:a}){return[{id:"select",header:({table:e})=>t.jsx(c,{checked:e.getIsAllPageRowsSelected()||e.getIsSomePageRowsSelected()&&"indeterminate",onCheckedChange:s=>e.toggleAllPageRowsSelected(!!s),"aria-label":"Select all",className:"translate-y-[2px]"}),cell:({row:e})=>t.jsx(c,{checked:e.getIsSelected(),onCheckedChange:s=>e.toggleSelected(!!s),"aria-label":"Select row",className:"translate-y-[2px]"}),enableSorting:!1,enableHiding:!1},{accessorKey:"name",header({column:e}){return t.jsxs(n,{variant:"ghost",onClick:()=>e.toggleSorting(e.getIsSorted()==="asc"),children:["Nama",t.jsx(j,{className:"w-4 h-4 ml-2"})]})}},{id:"actions",header(){return t.jsx("div",{className:"text-center",children:"Aksi"})},cell:({row:e})=>t.jsx(g,{row:e,name:"instances"})}]}function v({auth:a,instances:e,flash:s,appUrl:i}){const o=h({appUrl:i});return l.useEffect(()=>{s!=null&&s.success&&r.success(s.success),s!=null&&s.error&&r.error(s.error)},[s]),t.jsxs(p,{user:a.user,header:t.jsxs("div",{className:"flex items-center justify-between gap-2",children:[t.jsxs("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:["Dinas ( ",e.length," )"]}),t.jsxs(n,{className:"flex items-center gap-2",onClick:()=>m.visit("/instances/create"),children:[t.jsx(u,{className:"w-5 h-5"}),"Buat Baru"]})]}),children:[t.jsx(d,{title:"Dinas"}),t.jsx("div",{className:"px-8 pb-8 mx-auto max-w-7xl",children:t.jsx(x,{columns:o,data:e,name:"instances",searchParam:"name"})})]})}export{v as default};