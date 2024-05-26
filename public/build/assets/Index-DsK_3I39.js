import{r as n,j as a,A as $,y as V,Y as K}from"./app-BTbKT5nC.js";import{D as _,a as f}from"./DataTableColumnHeader-DQJ2uj6W.js";import{C as N,D as M}from"./checkbox-C_NFK94k.js";import{_ as x,c as y,B as k}from"./button-DpukZX7s.js";import{$ as F,b as z,c as B,d as h,e as L,D as G,P as O,C as Y,f as H}from"./index-BmskVJR_.js";import{$ as C,a as q,b as U,A as J}from"./AuthenticatedLayout-FwMqvxd9.js";import{$ as p}from"./index-CwSkdbo3.js";import{$ as Q}from"./index-B0qJIWLj.js";import{ImportForm as W}from"./_import_form-BNPhP7Lj.js";import"./popover-C6QiAeKj.js";import"./input-BGy5h4zV.js";import"./alert-dialog-iF6nmhrp.js";import"./separator-ByjmOZE7.js";import"./InputError-DbudQ56o.js";import"./label-CDhgRYO6.js";import"./index-COKPUyCZ.js";const w="Tabs",[X,Ce]=F(w,[C]),I=C(),[Z,T]=X(w),ee=n.forwardRef((s,e)=>{const{__scopeTabs:t,value:o,onValueChange:c,defaultValue:r,orientation:i="horizontal",dir:u,activationMode:m="automatic",...g}=s,d=Q(u),[l,b]=z({prop:o,onChange:c,defaultProp:r});return n.createElement(Z,{scope:t,baseId:B(),value:l,onValueChange:b,orientation:i,dir:d,activationMode:m},n.createElement(p.div,x({dir:d,"data-orientation":i},g,{ref:e})))}),te="TabsList",ae=n.forwardRef((s,e)=>{const{__scopeTabs:t,loop:o=!0,...c}=s,r=T(te,t),i=I(t);return n.createElement(q,x({asChild:!0},i,{orientation:r.orientation,dir:r.dir,loop:o}),n.createElement(p.div,x({role:"tablist","aria-orientation":r.orientation},c,{ref:e})))}),se="TabsTrigger",re=n.forwardRef((s,e)=>{const{__scopeTabs:t,value:o,disabled:c=!1,...r}=s,i=T(se,t),u=I(t),m=P(i.baseId,o),g=D(i.baseId,o),d=o===i.value;return n.createElement(U,x({asChild:!0},u,{focusable:!c,active:d}),n.createElement(p.button,x({type:"button",role:"tab","aria-selected":d,"aria-controls":g,"data-state":d?"active":"inactive","data-disabled":c?"":void 0,disabled:c,id:m},r,{ref:e,onMouseDown:h(s.onMouseDown,l=>{!c&&l.button===0&&l.ctrlKey===!1?i.onValueChange(o):l.preventDefault()}),onKeyDown:h(s.onKeyDown,l=>{[" ","Enter"].includes(l.key)&&i.onValueChange(o)}),onFocus:h(s.onFocus,()=>{const l=i.activationMode!=="manual";!d&&!c&&l&&i.onValueChange(o)})})))}),ne="TabsContent",oe=n.forwardRef((s,e)=>{const{__scopeTabs:t,value:o,forceMount:c,children:r,...i}=s,u=T(ne,t),m=P(u.baseId,o),g=D(u.baseId,o),d=o===u.value,l=n.useRef(d);return n.useEffect(()=>{const b=requestAnimationFrame(()=>l.current=!1);return()=>cancelAnimationFrame(b)},[]),n.createElement(L,{present:c||d},({present:b})=>n.createElement(p.div,x({"data-state":d?"active":"inactive","data-orientation":u.orientation,role:"tabpanel","aria-labelledby":m,hidden:!b,id:g,tabIndex:0},i,{ref:e,style:{...s.style,animationDuration:l.current?"0s":void 0}}),b&&r))});function P(s,e){return`${s}-trigger-${e}`}function D(s,e){return`${s}-content-${e}`}const ce=ee,S=ae,A=re,E=oe,ie=ce,R=n.forwardRef(({className:s,...e},t)=>a.jsx(S,{ref:t,className:y("inline-flex h-9 items-center justify-center rounded-lg bg-muted p-1 text-muted-foreground",s),...e}));R.displayName=S.displayName;const v=n.forwardRef(({className:s,...e},t)=>a.jsx(A,{ref:t,className:y("inline-flex items-center justify-center whitespace-nowrap rounded-md px-3 py-1 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow",s),...e}));v.displayName=A.displayName;const j=n.forwardRef(({className:s,...e},t)=>a.jsx(E,{ref:t,className:y("mt-2 ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2",s),...e}));j.displayName=E.displayName;function le({appUrl:s}){return[{id:"select",header:({table:e})=>a.jsx(N,{checked:e.getIsAllPageRowsSelected()||e.getIsSomePageRowsSelected()&&"indeterminate",onCheckedChange:t=>e.toggleAllPageRowsSelected(!!t),"aria-label":"Select all",className:"translate-y-[2px]"}),cell:({row:e})=>a.jsx(N,{checked:e.getIsSelected(),onCheckedChange:t=>e.toggleSelected(!!t),"aria-label":"Select row",className:"translate-y-[2px]"}),enableSorting:!1,enableHiding:!1},{accessorKey:"number",meta:"No.",header:({column:e})=>a.jsx(f,{column:e,title:"No."})},{accessorKey:"from",meta:"Pemohon",header:({column:e})=>a.jsx(f,{column:e,title:"Pemohon"}),cell(e){const t=e.getValue();return t.length>20?t.slice(0,20)+"...":t}},{accessorKey:"phone",meta:"Telepon",header:({column:e})=>a.jsx(f,{column:e,title:"Telepon"})},{accessorKey:"instance_name",meta:"Dinas",header:({column:e})=>a.jsx(f,{column:e,title:"Dinas"})},{accessorKey:"subject",meta:"Perizinan",header:({column:e})=>a.jsx(f,{column:e,title:"Perizinan"}),cell(e){const t=e.getValue();return t.length>20?t.slice(0,20)+"...":t}},{accessorKey:"description",meta:"Keterangan",header:({column:e})=>a.jsx(f,{column:e,title:"Keterangan"})},{id:"is_corrective",header:({column:e})=>a.jsx(f,{column:e,title:"Dikembalikan"}),cell:({row:e})=>{const t=e.original.corrective_action?"Ya":"Tidak";return a.jsxs("div",{className:"flex items-center justify-center gap-2",children:[a.jsx("p",{className:`text-${t==="Ya"?"green":"red"}-500`,children:t}),t==="Ya"?a.jsx(Y,{className:"text-green-500 size-4"}):a.jsx(H,{className:"text-red-500 size-4"})]})}},{accessorKey:"petugas",meta:"Petugas",header:({column:e})=>a.jsx(f,{column:e,title:"Petugas"}),cell(e){const t=e.getValue();return t?t.length>20?t.slice(0,20)+"...":t:a.jsx("div",{className:"flex items-center justify-center",children:"-"})}},{accessorKey:"issue_date",meta:"Tanggal Masuk",header:({column:e})=>a.jsx(f,{column:e,title:"Tanggal Masuk"}),filterFn:"dateRangeFilter",cell(e){return new Date(e.getValue()).toLocaleString("id-ID",{day:"numeric",month:"short",year:"numeric",hour:"2-digit",minute:"2-digit"})}},{accessorKey:"verification_date",meta:"Tanggal Verifikasi",header:({column:e})=>a.jsx(f,{column:e,title:"Tanggal Verifikasi"}),filterFn:"dateRangeFilter",cell(e){return new Date(e.getValue()).toLocaleString("id-ID",{day:"numeric",month:"short",year:"numeric",hour:"2-digit",minute:"2-digit"})}},{id:"actions",header(){return a.jsx("div",{className:"text-center",children:"Aksi"})},cell:({row:e})=>a.jsx(M,{row:e,name:"documents"})}]}function de(){return[{accessorKey:"from",header:"Pemohon"},{accessorKey:"subject",header:"Perizinan"},{accessorKey:"corrective_action_count",header:"Dikembalikan",cell(s){const e=s.getValue();return e===0?"-":e+" kali"}},{accessorKey:"corrective_action_last_date",header:"Tanggal Terakhir Perbaikan",cell(s){const e=s.getValue();return e?new Date(e).toLocaleString("id-ID",{day:"numeric",month:"short",year:"numeric",hour:"2-digit",minute:"2-digit"}):"-"}}]}function we({appUrl:s,auth:e,doc_type:t,documents:o,summary:c,flash:r}){const[i,u]=n.useState(!1),m=le({appUrl:s}),g=de();n.useEffect(()=>{u(!1),$.dismiss(),r!=null&&r.success&&$.success(r.success),r!=null&&r.error&&$.error(r.error)},[r]);const d=o.length,l=t==="central"?` Pusat (${d})`:` Timur (${d})`;return typeof c=="object"&&(c=Object.keys(c).map(b=>c[b])),a.jsxs(J,{user:e.user,header:a.jsxs("div",{className:"flex items-center justify-between gap-2",children:[a.jsxs("h2",{className:"text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200",children:["Surat Masuk",l]}),a.jsxs("div",{className:"flex items-center gap-2",children:[a.jsx("a",{href:route("documents.file.export"),children:a.jsxs(k,{variant:"secondary",type:"button",children:[a.jsx(G,{className:"w-5 h-5"}),"Export"]})}),a.jsx(W,{doc_type:t,setImportOpen:u,importOpen:i}),a.jsxs(k,{className:"flex items-center gap-2",onClick:()=>V.visit(`/documents/create?type=${t}`),children:[a.jsx(O,{className:"w-5 h-5"}),"Buat Baru"]})]})]}),children:[a.jsx(K,{title:`Surat Masuk ${l}`}),a.jsx("div",{className:"px-8 pb-8 mx-auto max-w-[1728px]",children:a.jsxs(ie,{defaultValue:"all",children:[a.jsxs(R,{className:"grid w-full grid-cols-2 mb-4",children:[a.jsx(v,{value:"all",children:"Semua"}),a.jsx(v,{value:"summary",children:"Ringkasan"})]}),a.jsx(j,{value:"all",children:a.jsx(_,{columns:m,data:o,name:"documents",doc_type:"central",searchParam:"from"})}),a.jsx(j,{value:"summary",children:a.jsx(_,{columns:g,data:c.filter(b=>b.corrective_action_count>0),name:"documents",doc_type:"central",searchParam:"from"})})]})})]})}export{we as default};
