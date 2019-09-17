/**
 * Created by Surkov Egor on 11.09.2019.
 */

public with sharing class StreamingAPIController {

        public StreamingAPIController() {
        }
        public List<Opportunity> getlistOpportunity() {
            return [SELECT Id, Name,StageName FROM Opportunity where Amount>=100000];
        }
        public PageReference refresh() {
            getlistOpportunity();
            return null;
        }
    }

