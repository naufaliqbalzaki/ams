import{r as u,W as l,j as e}from"./app-nsa1m-Vz.js";import{I as p}from"./InputError-BfTHJ5wo.js";import{B as d}from"./button-DH7x16na.js";import{I as c}from"./input-BkKq4vFi.js";import{L as f}from"./label-ATOVkcFi.js";import"./index-CI2j9jvt.js";import"./index-CxNQn363.js";const w=({appUrl:x,instance:t})=>{u.useState(null);const{data:a,setData:m,post:s,processing:o,errors:i}=l(t||{name:"",_method:"post"}),n=r=>{r.preventDefault(),t&&t.id&&(a._method="put",s(route("instances.update",t.id),{forceFormData:!0})),t||s(route("instances.store"))};return e.jsxs("form",{onSubmit:n,children:[e.jsxs("div",{children:[e.jsx(f,{htmlFor:"name","aria-required":!0,required:!0,children:"Nama"}),e.jsx(c,{id:"name",type:"text",name:"name",value:a.name,className:"block w-full mt-1",autoComplete:"additional-name",onChange:r=>m("name",r.target.value)}),e.jsx(p,{message:i.name,className:"mt-2"})]}),e.jsx("div",{className:"flex items-center justify-between mt-4",children:e.jsx(d,{type:"submit",className:"w-full mt-2",disabled:o,children:t?"Ubah":"Buat"})})]})};export{w as InstanceForm};
