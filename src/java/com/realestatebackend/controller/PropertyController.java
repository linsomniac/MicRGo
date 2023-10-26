@RestController
@RequestMapping("/api/properties")
public class PropertyController {

    @Autowired
    private PropertyService service;

    @PostMapping
    public Property addProperty(@RequestBody Property property) {
        return service.saveProperty(property);
    }

    @GetMapping("/unsold")
    public List<Property> listUnsold() {
        return service.listUnsold();
    }

    @PatchMapping("/{id}/sold")
    public void markAsSold(@PathVariable Long id) {
        service.markAsSold(id);
    }
}
