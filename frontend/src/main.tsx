import { createRoot } from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router";

import "./index.css";
import Login from "./page/login/Login";
import Home from "./page/home/Home";
import Dashboard from "./page/home/component/features/Dashboard";
import StaffManagement from "./page/home/component/features/StaffManagement/StaffManagement";
import Addpatient from "./page/home/component/features/Addpatient";
import Searchpatient from "./page/home/component/features/Searchpatient";
import Reserveschart from "./page/home/component/features/Reserveschart";
import Refer from "./page/home/component/features/Refer";

createRoot(document.getElementById("root")!).render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="home" element={<Home />}>
        <Route path="/home" element={<Dashboard />} />
        <Route path="management" element={<StaffManagement />} />
        <Route path="addpatient" element={<Addpatient />} />
        <Route path="searchpatient" element={<Searchpatient />} />
        <Route path="chartreserve" element={<Reserveschart />} />
        <Route path="refer" element={<Refer />} />
      </Route>
    </Routes>
  </BrowserRouter>
);
