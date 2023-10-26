<template>
  <div>
    <h3>Unsold Properties</h3>
    <ul v-if="properties.length">
      <li v-for="property in properties" :key="property.id">
        {{ property.address }} - ${{ property.price }}
        <Button label="Mark as Sold" @click="markAsSold(property.id)" />
      </li>
    </ul>
    <p v-else>No unsold properties</p>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: ['properties'],
  methods: {
    markAsSold(id) {
      axios.patch(`/api/properties/${id}/sold`).then(() => {
        this.$emit('propertySold');
      });
    }
  }
}
</script>
