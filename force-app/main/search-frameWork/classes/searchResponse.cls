/**
 * Created by Surkov Egor on 05.09.2019.
 */

public with sharing class searchResponse {

    @AuraEnabled public List <SObject> pageRecords;
    @AuraEnabled public PaginationData paginationData;

     public SearchResponse(List<SObject> pageRecords, PaginationData paginationData){
         this.pageRecords = pageRecords;
         this.paginationData = paginationData;
     }

}