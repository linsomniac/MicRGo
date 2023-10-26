<template>
  <div class="p-d-flex p-flex-column p-mb-5">
    <h3>Add Property</h3>
    <InputText v-model="property.address" placeholder="Address" />
    <InputNumber v-model="property.price" mode="currency" currency="USD" />
    <Button label="Add" @click="addProperty" />
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      property: {
        address: '',
        price: 0,
        sold: false
      }
    }
  },
  methods: {
    addProperty() {
      axios.post('/api/properties', this.property).then(() => {
        this.$emit('propertyAdded');
        this.property.address = '';
        this.property.price = 0;
      });
    }
  }
}
</script>
