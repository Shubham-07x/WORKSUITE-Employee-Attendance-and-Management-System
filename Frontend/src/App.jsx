import 'bootstrap/dist/css/bootstrap.min.css'
import {BrowserRouter, Routes, Route} from 'react-router-dom'
import Login from './components/Login'
import Dashboard from './components/Dashboard'
import Home from './components/Home'
import Employee from './components/Employee'
import Category from './components/Category'
import ManageAdmin from './components/ManageAdmin'
import AddCategory from './components/AddCategory'
import AddEmployee from './components/AddEmployee'
import EditEmployee from './components/EditEmployee'
import Start from './components/Start'
import EmployeeLogin from './components/EmployeeLogin'
import EmployeeDetail from './components/EmployeeDetail'
import PrivateRoute from './components/PrivateRoute'
import 'react-toastify/dist/ReactToastify.css';
import Office from './components/Office';


function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Start />}></Route>
        <Route path='/adminlogin' element={<Login/>}></Route>
        <Route path='/employeelogin' element={<EmployeeLogin/>}></Route>
        <Route path="/employeedetail/:id" element={<PrivateRoute><EmployeeDetail /></PrivateRoute>} />
        <Route path="/dashboard" element={<PrivateRoute><Dashboard /></PrivateRoute>}>
          <Route path='' element={<Home />}></Route>
          <Route path='/dashboard/employee' element={<Employee />}></Route>
          <Route path='/dashboard/category' element={<Category />}></Route>
          <Route path='/dashboard/manageadmin' element={<ManageAdmin />}></Route>
          <Route path='/dashboard/add_category' element={<AddCategory />}></Route>
          <Route path='/dashboard/add_employee' element={<AddEmployee />}></Route>
          <Route path='/dashboard/edit_employee/:id' element={<EditEmployee />}></Route>
          <Route path='/dashboard/officeaddress' element={<Office />}></Route>
        </Route>
      </Routes>
    </BrowserRouter>
  )
}

export default App
