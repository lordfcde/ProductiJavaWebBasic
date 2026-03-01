package DTO;

import DTO.Products;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-03-01T15:10:55")
@StaticMetamodel(Accounts.class)
public class Accounts_ { 

    public static volatile SingularAttribute<Accounts, Date> birthday;
    public static volatile SingularAttribute<Accounts, Boolean> isUse;
    public static volatile SingularAttribute<Accounts, String> lastName;
    public static volatile SingularAttribute<Accounts, String> firstName;
    public static volatile ListAttribute<Accounts, Products> productsList;
    public static volatile SingularAttribute<Accounts, Boolean> gender;
    public static volatile SingularAttribute<Accounts, String> pass;
    public static volatile SingularAttribute<Accounts, String> phone;
    public static volatile SingularAttribute<Accounts, String> account;
    public static volatile SingularAttribute<Accounts, Integer> roleInSystem;

}