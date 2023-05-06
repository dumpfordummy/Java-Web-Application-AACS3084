/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;

/**
 *
 * @author CY
 */
public class EmployeeService {
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public EmployeeService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addEmployee(Employee employee) {
        try {
            mgr.persist(employee);
        } catch (EntityExistsException ex) {
            Logger.getLogger(EmployeeService.class.getName()).log(Level.SEVERE, "Error while adding entity, duplicated entity found", ex);
            return false;
        } catch (IllegalArgumentException | TransactionRequiredException ex) {
            Logger.getLogger(EmployeeService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public Employee findEmployeeById(String id) {
        Employee employee = mgr.find(Employee.class, id);
        return employee;
    }
    
    public Employee findEmployeeByUsername(String username) {
         try {
            return (Employee) mgr.createNamedQuery("Employee.findByUsername").setParameter("username", username).getSingleResult();
        } catch (EntityExistsException ex) {
            Logger.getLogger(EmployeeService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean deleteEmployee(String id) {
        Employee employee = findEmployeeById(id );
        if (employee != null) {
            mgr.remove(employee);
            return true;
        }
        return false;
    }
    
    public List<Employee> findAll() {
        List employeeList = mgr.createNamedQuery("Employee.findAll").getResultList();
        return employeeList;
    }
    
    public Employee updateEmployee(Employee employee) {
        return (Employee) mgr.merge(employee);
    }
}
