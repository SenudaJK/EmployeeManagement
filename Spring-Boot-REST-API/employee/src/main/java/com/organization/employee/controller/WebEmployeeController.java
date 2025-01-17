package com.organization.employee.controller;

import com.organization.employee.dto.EmployeeDTO;
import com.organization.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/employees")
public class WebEmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/form")
    public String showEmployeeForm(@RequestParam(required = false) Long id, Model model) {
        if (id != null) {
            EmployeeDTO employee = employeeService.getEmployeeById(id);
            model.addAttribute("employee", employee);
        } else {
            model.addAttribute("employee", new EmployeeDTO());
        }
        return "employeeForm";
    }

    @PostMapping("/submit")
    public String submitEmployee(@ModelAttribute EmployeeDTO employeeDTO) {
        try {
            if (employeeDTO.getId() != null) {
                employeeService.updateEmployee(employeeDTO.getId(), employeeDTO);
            } else {
                employeeService.createEmployee(employeeDTO);
            }
            return "redirect:/employees/view";
        } catch (Exception e) {
            e.printStackTrace(); // Log the error
            return "errorPage"; // Replace this with your error page template
        }
    }


    @GetMapping("/view")
    public String viewEmployees(Model model) {
        List<EmployeeDTO> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "viewEmployees";
    }

    @GetMapping("/search")
    public String searchEmployee(@RequestParam String email, Model model) {
        EmployeeDTO employee = employeeService.getEmployeeByEmail(email);
        model.addAttribute("employees", List.of(employee));
        return "viewEmployees";
    }

    @PostMapping("/delete")
    public String deleteEmployee(@RequestParam Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employees/view";
    }
}