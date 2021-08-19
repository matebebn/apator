package com.example.apatorTask.model;

import javax.persistence.*;


@Entity
@Table(name ="queue")
public class User {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name="user_id")
        private Integer user_id;

        @Column(name="user_unique_number")
        private String user_unique_number;

        @Column(name="user_pseudonym")
        private String user_pseudonym;

        @Column(name="type_user")
        private String type_user;

        public User() {
        }

        public User(Integer user_id, String user_unique_number, String user_pseudonym, String type_user) {
                this.user_id = user_id;
                this.user_unique_number = user_unique_number;
                this.user_pseudonym = user_pseudonym;
                this.type_user = type_user;
        }

        public Integer getUser_id() {
                return user_id;
        }

        public void setUser_id(Integer user_id) {
                this.user_id = user_id;
        }

        public String getUser_unique_number() {
                return user_unique_number;
        }

        public void setUser_unique_number(String user_unique_number) {
                this.user_unique_number = user_unique_number;
        }

        public String getUser_pseudonym() {
                return user_pseudonym;
        }

        public void setUser_pseudonym(String user_pseudonym) {
                this.user_pseudonym = user_pseudonym;
        }

        public String getType_user() {
                return type_user;
        }

        public void setType_user(String type_user) {
                this.type_user = type_user;
        }
}
