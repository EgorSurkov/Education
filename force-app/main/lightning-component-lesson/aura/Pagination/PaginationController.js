/**
 * Created by user on 06.09.2019.
 */
({
  doPrevious: function(component, event, helper) {
    var pagination = component.get('v.pagination');
    if(pagination.currentPage > 1) pagination.currentPage -= 1;
    if(pagination.currentPage  == 1) prevButton.set('v.disabled', true);
    component.set('v.pagination', pagination);
    component.getEvent('onchange').fire();
  },

  doNext: function(component, event, helper) {
    var pagination = component.get('v.pagination');
    if(pagination.currentPage < pagination.pagesCount) pagination.currentPage += 1;
    if(pagination.currentPage  > 1) prevButton.set('v.disabled', false);
    component.set('v.pagination', pagination);
    component.getEvent('onchange').fire();
  }

});