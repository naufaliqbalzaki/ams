import{W as d,r as p,j as s,Y as l}from"./app-BTbKT5nC.js";import{I as c}from"./InputError-DbudQ56o.js";import{B as f}from"./button-DpukZX7s.js";import{I as u}from"./input-BGy5h4zV.js";import{L as x}from"./label-CDhgRYO6.js";import{G as w}from"./GuestLayout-Ckwo5jGj.js";import"./index-COKPUyCZ.js";import"./index-CwSkdbo3.js";function E(){const{data:a,setData:e,post:t,processing:o,errors:m,reset:i}=d({password:""});p.useEffect(()=>()=>{i("password")},[]);const n=r=>{r.preventDefault(),t(route("password.confirm"))};return s.jsxs(w,{children:[s.jsx(l,{title:"Confirm Password"}),s.jsx("div",{className:"mb-4 text-sm text-gray-600 dark:text-gray-400",children:"This is a secure area of the application. Please confirm your password before continuing."}),s.jsxs("form",{onSubmit:n,children:[s.jsxs("div",{className:"mt-4",children:[s.jsx(x,{htmlFor:"password",children:"Password"}),s.jsx(u,{id:"password",type:"password",name:"password",value:a.password,className:"block w-full mt-1",onChange:r=>e("password",r.target.value)}),s.jsx(c,{message:m.password,className:"mt-2"})]}),s.jsx("div",{className:"flex items-center justify-end mt-4",children:s.jsx(f,{className:"ms-4",disabled:o,children:"Confirm"})})]})]})}export{E as default};