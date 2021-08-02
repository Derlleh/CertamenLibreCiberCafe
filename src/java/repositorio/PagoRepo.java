/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;


import entidades.Pago;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pablo Saez
 */
@Transactional
@Repository
public class PagoRepo {
    
    @PersistenceContext
    private EntityManager em;
    
    public ArrayList<Pago> listar()
    {
        return new ArrayList(
        em.createQuery("SELECT p FROM Pago p").getResultList());
    }
    
    public void guardar(Pago p)
    {
        em.persist(p);
    }
    
    public void actualizar(Pago p)
    {
        em.merge(p);
    }
    
    public void eliminar(int id)
    {
        Pago p = em.find(Pago.class, id);
        em.remove(p);
    }
    
    public Pago find(int id)
    {
        return em.find(Pago.class, id);
    }
}
