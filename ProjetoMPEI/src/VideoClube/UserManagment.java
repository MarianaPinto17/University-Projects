package VideoClube;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

/**
 * Created by TomásFreitas on 26/09/2017.
 */
public class UserManagment {
    private  HashMap<Integer, Client> userDB = new HashMap<>();
    private LinkedList<String> username = new LinkedList<>();

    public  void adduser(Client toadd){
        userDB.put(toadd.getClientid(), toadd);
        username.add(toadd.getName());
    }

    public int id(String name){
        for (Map.Entry<Integer, Client> entry : userDB.entrySet()) {
            if(entry.getValue().getName().equalsIgnoreCase(name)){
                return entry.getKey();
            }
        }
        return -1;
    }

    public  void removeUser(int id){
        if (userDB.containsKey(id)){
            System.out.println("Removed user " + userDB.get(id).getName());
            userDB.remove(id);

        }else{
            System.out.println("User doesn't exist");
        }
    }

    public LinkedList<String> getUsername(){
        return username;
    }

    int getClientAge(int id){
        return userDB.get(id).getage();
    }

    public Client getClient(int id){
        return userDB.get(id);
    }

}
