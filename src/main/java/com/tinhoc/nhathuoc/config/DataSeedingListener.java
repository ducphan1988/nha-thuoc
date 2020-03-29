//package com.codegym.casestudyspringfuramaresort.config;
//
//import com.codegym.casestudyspringfuramaresort.entity.Role;
//import com.codegym.casestudyspringfuramaresort.entity.User;
//import com.codegym.casestudyspringfuramaresort.repository.RoleRepository;
//import com.codegym.casestudyspringfuramaresort.repository.UserRepository;
//import com.codegym.casestudyspringfuramaresort.utils.EncrypPasswordUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextRefreshedEvent;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.HashSet;
//
//@Component
//public class DataSeedingListener implements ApplicationListener<ContextRefreshedEvent> {
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private RoleRepository roleRepository;
//
//    @Override
//    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
//        if (roleRepository.findByName("ROLE_ADMIN")==null){
//            roleRepository.save(new Role("ROLE_ADMIN"));
//        }
//
//        if (roleRepository.findByName("ROLE_MEMBER")==null){
//            roleRepository.save(new Role("ROLE_MEMBER"));
//        }
//
//        //them admin
//        if (userRepository.findByEmail("admin@gmail.com") == null){
//            User admin = new User();
//            admin.setEmail("admin@gmail.com");
//            admin.setPassword(EncrypPasswordUtils.EncrypPasswordUtils("123456"));
//            HashSet<Role> roles = new HashSet<>();
//            roles.add(roleRepository.findByName("ROLE_ADMIN"));
//            roles.add(roleRepository.findByName("ROLE_MEMBER"));
//            admin.setRoles(roles);
//            userRepository.save(admin);
//        }
//        ArrayList<String> a = new ArrayList<>();
////        a.clone()
//
//        //Them Member
//        if (userRepository.findByEmail("member@gmail.com") == null){
//            User user = new User();
//            user.setEmail("member@gmail.com");
//            user.setPassword(EncrypPasswordUtils.EncrypPasswordUtils("123456"));
//            HashSet<Role> roles = new HashSet<>();
//            roles.add(roleRepository.findByName("ROLE_MEMBER"));
//            user.setRoles(roles);
//            userRepository.save(user);
//        }
//    }
//}
