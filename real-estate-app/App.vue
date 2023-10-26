<template>
  <div class="p-d-flex p-jc-center p-ai-center p-mt-5">
    <PropertyForm @propertyAdded="fetchUnsoldProperties" />
    <PropertyList :properties="unsoldProperties" @propertySold="fetchUnsoldProperties"/>
  </div>
</template>

<script>
import PropertyForm from './components/PropertyForm.vue'
import PropertyList from './components/PropertyList.vue'
import axios from 'axios';

export default {
  data() {
    return {
      unsoldProperties: []
    }
  },
  components: {
    PropertyForm,
    PropertyList
  },
  methods: {
    fetchUnsoldProperties() {
      axios.get('/api/properties/unsold').then(response => {
        this.unsoldProperties = response.data;
      });
    }
  },
  mounted() {
    this.fetchUnsoldProperties();
  }
}
</script>
