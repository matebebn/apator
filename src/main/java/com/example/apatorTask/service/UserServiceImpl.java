package com.example.apatorTask.service;

import com.example.apatorTask.hibernate.HibernateUtil;
import com.example.apatorTask.model.User;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import javax.persistence.Query;
import java.util.List;
import java.util.Random;


@Service
public class UserServiceImpl implements UserService {

    private String unique_number;

    private static final int limitResultsPerPage = 10;

    @Override
    public boolean addUserToDatabase(String pseudonym,String type_user) {
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

                User user = new User();
                user.setUser_pseudonym(pseudonym);
                user.setType_user(type_user);
                user.setUser_unique_number("-");
                session.save(user);
                user.setUser_unique_number(generateUniqueNumber()+user.getUser_id());
                session.update(user);
                unique_number=user.getUser_unique_number();
                transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }


        return true;

    }

    @Override
    public Long totalUserNumber() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Long count = (Long) session.createQuery("select count(*) from User").uniqueResult();
            count=count/limitResultsPerPage;
            return count;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }


    }

    @Override
    public List<User> getAllUsers() {
        List userList = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery("From User order by type_user asc,user_id asc ");
            userList=query.getResultList();
        }catch(Exception e){
            e.printStackTrace();
        }
        return userList;

    }


    @Override
    public List<User> getUsers(int page) {
        List userList = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query query = session.createQuery("From User order by type_user asc,user_id asc ");
            query.setFirstResult(page * limitResultsPerPage);
            query.setMaxResults(limitResultsPerPage);
            userList=query.getResultList();


        }catch(Exception e){
            e.printStackTrace();
        }
        return userList;

    }


    public String generateUniqueNumber()  {
        Random gen = new Random();
        int number=gen.nextInt(50);
        return "#" + number;
    }

    public String getUnique_number(){
        return unique_number;
    }
}

















