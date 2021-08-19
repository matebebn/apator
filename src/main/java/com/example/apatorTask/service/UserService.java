package com.example.apatorTask.service;



import com.example.apatorTask.model.User;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface UserService {


boolean addUserToDatabase(String pseudonym,String type_user);

String generateUniqueNumber()  ;

String getUnique_number();

Long totalUserNumber();

List<User> getUsers(int page);

List<User> getAllUsers();
}
