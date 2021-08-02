/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import entidades.Cliente;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pablo Saez
 */

@Transactional
@Repository
public class ClienteRepo {
    
      
    @PersistenceContext
    private EntityManager em;
    
    public ArrayList<Cliente> listar()   {
        return new ArrayList(
                em.createQuery("SELECT c FROM Cliente c")
                .getResultList());
        
    }
    
    public void guardar(Cliente c)
    {
        em.persist(c);
    }
    
    public void eliminar(int id)
    {
        Cliente c = em.find(Cliente.class, id);
        em.remove(c);
    }
    
    public void actualizar(Cliente c)
    {
        em.merge(c);
    }
    
    public Cliente find(int id)
    {
        return em.find(Cliente.class, id);
    }
    
    public ArrayList<Cliente> filtrar(Map<String,String> parametros){
        String sql ="SELECT * FROM cliente";
        Query q; 
        if(parametros.size()>0)
        {
            ArrayList<String> c = new ArrayList();
            for(Entry<String,String> par:parametros.entrySet())
                c.add(par.getKey()+"=?");
             sql+=" WHERE "+String.join(" AND ", c);
             q = em.createNativeQuery(sql, Cliente.class);
             int contador = 1; 
             for(Entry<String,String> par:parametros.entrySet()){
                 q = q.setParameter(contador, par.getValue()); 
                 contador++;
             }
             return new ArrayList(q.getResultList());
        }
        q = em.createNativeQuery(sql, Cliente.class);
        return new ArrayList(q.getResultList());
        
    }
    
}
