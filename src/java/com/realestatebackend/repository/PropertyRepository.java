public interface PropertyRepository extends JpaRepository<Property, Long> {
    List<Property> findBySoldFalse();
}
