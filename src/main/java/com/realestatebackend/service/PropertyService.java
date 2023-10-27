import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class PropertyService {

    @Autowired
    private PropertyRepository repository;

    public Property saveProperty(Property property) {
        return repository.save(property);
    }

    public List<Property> listUnsold() {
        return repository.findBySoldFalse();
    }

    public void markAsSold(Long id) {
        Property property = repository.findById(id).orElseThrow();
        property.setSold(true);
        repository.save(property);
    }
}
