/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import entidades.Cliente;
import entidades.Juego;
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
public class JuegoRepo {
    
    @PersistenceContext
    private EntityManager em;
    
    public ArrayList<Juego> listar()
    {
        return new ArrayList(em.createQuery("SELECT j FROM Juego j")
                .getResultList());
    }
    
    public void guardar(Juego j)
    {
        em.persist(j);
    }
    
    public Juego find(int id)
    {
        return em.find(Juego.class, id);
    }
    
    public void actualizar(Juego j){
        em.merge(j);
    }
    
    public void eliminar(int id)
    {
        Juego j = em.find(Juego.class, id);
        em.remove(j);
    }
    
    public ArrayList<Cliente> filtrar(Map<String,String> parametros){
        String sql ="SELECT * FROM juego";
          Query q; 
        if(parametros.size()>0)
        {
            ArrayList<String> j = new ArrayList();
            for(Entry<String,String> par:parametros.entrySet())
             j.add(par.getKey()+"=?");
             sql+=" WHERE "+String.join(" AND ", j);
             q = em.createNativeQuery(sql, Juego.class);
              int contador = 1; 
             for(Entry<String,String> par:parametros.entrySet()){
                 q = q.setParameter(contador, par.getValue()); 
                 contador++;
             }
             return new ArrayList(q.getResultList());
        }
            q = em.createNativeQuery(sql, Juego.class);
            return new ArrayList(q.getResultList());
    }
        
    
}
