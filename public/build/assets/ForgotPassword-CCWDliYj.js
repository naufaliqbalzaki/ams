import{W as n,j as e,Y as d}from"./app-BTbKT5nC.js";import{I as u}from"./InputError-DbudQ56o.js";import{B as c}from"./button-DpukZX7s.js";import{I as x}from"./input-BGy5h4zV.js";import{G as p}from"./GuestLayout-Ckwo5jGj.js";function y({status:t}){const{data:a,setData:r,post:o,processing:m,errors:l}=n({email:""}),i=s=>{s.preventDefault(),o(route("password.email"))};return e.jsxs(p,{children:[e.jsx(d,{title:"Forgot Password"}),e.jsx("div",{className:"mb-4 text-sm text-gray-600 dark:text-gray-400",children:"Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one."}),t&&e.jsx("div",{className:"mb-4 text-sm font-medium text-green-600 dark:text-green-400",children:t}),e.jsxs("form",{onSubmit:i,children:[e.jsx(x,{id:"email",type:"email",name:"email",value:a.email,className:"block w-full mt-1",onChange:s=>r("email",s.target.value)}),e.jsx(u,{message:l.email,className:"mt-2"}),e.jsx("div",{className:"flex items-center justify-end mt-4",children:e.jsx(c,{className:"ms-4",disabled:m,children:"Email Password Reset Link"})})]})]})}export{y as default};