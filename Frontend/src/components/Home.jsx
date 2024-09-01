import axios from 'axios';
import { useEffect, useState } from 'react';

const Home = () => {
  const [adminTotal, setAdminTotal] = useState(0);
  const [employeeTotal, setEmployeeTotal] = useState(0);
  const [salaryTotal, setSalaryTotal] = useState(0);
  const [admins, setAdmins] = useState([]);
  const [editingAdminId, setEditingAdminId] = useState(null);
  const [editedEmail, setEditedEmail] = useState('');
  const apiUrl = import.meta.env.VITE_API_URL;

  useEffect(() => {
    adminCount();
    employeeCount();
    salaryCount();
    adminRecords();
  }, []);

  const adminRecords = () => {
    axios.get(`${apiUrl}/auth/admin_records`)
      .then(result => {
        if (result.data.Status) {
          setAdmins(result.data.Result);
        } else {
          alert(result.data.Error);
        }
      })
      .catch(error => console.error('Error fetching admin records:', error));
  };

  const adminCount = () => {
    axios.get(`${apiUrl}/auth/admin_count`)
      .then(result => {
        if (result.data.Status) {
          setAdminTotal(result.data.Result[0].admin);
        }
      })
      .catch(error => console.error('Error fetching admin count:', error));
  };

  const employeeCount = () => {
    axios.get(`${apiUrl}/auth/employee_count`)
      .then(result => {
        if (result.data.Status) {
          setEmployeeTotal(result.data.Result[0].employee);
        }
      })
      .catch(error => console.error('Error fetching employee count:', error));
  };

  const salaryCount = () => {
    axios.get(`${apiUrl}/auth/salary_count`)
      .then(result => {
        if (result.data.Status) {
          setSalaryTotal(result.data.Result[0].salaryofemp);
        } else {
          alert(result.data.Error);
        }
      })
      .catch(error => console.error('Error fetching salary count:', error));
  };
  const handleEditAdmin = (id) => {
    setEditingAdminId(id);
    // Fetch the admin's current email and populate the form field
    const adminToEdit = admins.find(admin => admin.id === id);
    setEditedEmail(adminToEdit.email);
  };

  const handleEditSubmit = () => {
    axios.put(`${apiUrl}/auth/edit_admin/${editingAdminId}`, { email: editedEmail })
      .then(result => {
        if (result.data.success) {
          // Update the admin's email in the local state
          setAdmins(admins.map(admin => {
            if (admin.id === editingAdminId) {
              return { ...admin, email: editedEmail };
            }
            return admin;
          }));
          alert("Admin email updated successfully");
          setEditingAdminId(null); // Clear editing state
        } else {
          alert("Failed to update admin email");
        }
      })
      .catch(error => console.error('Error updating admin:', error));
  };

  const handleDeleteAdmin = (id) => {
    axios.delete(`${apiUrl}/auth/delete_admin/${id}`)
      .then(result => {
        if (result.data.success) {
          // Update admins state to reflect the deletion
          setAdmins(admins.filter(admin => admin.id !== id));
          alert("Admin deleted successfully");
        } else {
          alert("Failed to delete admin");
        }
      })
      .catch(error => console.error('Error deleting admin:', error));
  };

  return (
    <div>
      <div className='p-3 d-flex flex-wrap justify-content-around mt-3'>
        <div className='px-3 pt-2 pb-3 mb-3 HomeCard' style={{backgroundColor: '#FFFAFA', width: '300px' }}>
          <div className='text-center pb-1'>
            <h4>Admin</h4>
          </div>
          <hr />
          <div className='d-flex justify-content-between'>
            <h5>Total:</h5>
            <h5>{adminTotal}</h5>
          </div>
        </div>
        <div className='px-3 pt-2 pb-3 mb-3 HomeCard' style={{backgroundColor: '#F7F9FF', width: '300px' }}>
          <div className='text-center pb-1'>
            <h4>Employee</h4>
          </div>
          <hr />
          <div className='d-flex justify-content-between'>
            <h5>Total:</h5>
            <h5>{employeeTotal}</h5>
          </div>
        </div>
        <div className='px-3 pt-2 pb-3 mb-3 HomeCard' style={{backgroundColor: '#FFFDF8', width: '300px' }}>
          <div className='text-center pb-1'>
            <h4>Salary</h4>
          </div>
          <hr />
          <div className='d-flex justify-content-between'>
            <h5>Total:</h5>
            <h5>₹{salaryTotal}</h5>
          </div>
        </div>
      </div>
      <div className='mt-4 px-2'>
        <h3 className="text-left px-5">List of Admins</h3>
        <div className="table-responsive px-5">
          <table className='table'>
            <thead>
              <tr>
                <th>Email</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {admins.map(admin => (
                <tr key={admin.id}>
                  <td>
                    {editingAdminId === admin.id ? (
                      <input type="text" value={editedEmail} onChange={(e) => setEditedEmail(e.target.value)} />
                    ) : (
                      admin.email
                    )}
                  </td>
                  <td >
                    {editingAdminId === admin.id ? (
                      <div>
                        <button className="btn btn-success btn-sm mx-2" onClick={handleEditSubmit}>Save</button>
                        <button className="btn btn-warning btn-sm mx-2" onClick={() => setEditingAdminId(null)}>Cancel</button>
                      </div>
                    ) : (
                      <>
                        <button className="btn btn-info btn-sm mx-2" onClick={() => handleEditAdmin(admin.id)}>Edit</button>
                        <button className="btn btn-danger btn-sm mx-2" onClick={() => handleDeleteAdmin(admin.id)}>Delete</button>
                      </>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Home;
