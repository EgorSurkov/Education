
/**
 * Created by Surkov Egor on 05.09.2019.
 */

@IsTest
private class Test_StudyParticipantFilter {
    @IsTest
    static void testBehavior() {
        Test.startTest();
        Contact contact = new Contact(LastName = 'TestFil');
        insert Contact;
        Clinical_Study__c clinicalStudy = new Clinical_Study__c(Title__c = 'MyTitleTest');
        insert clinicalStudy;

        Study_Participant__c studyParticipant = new Study_Participant__c(
                Contact__c = contact.Id,
                Clinical_Study__c = clinicalStudy.Id,
                Status__c = 'Open'
        );

        insert studyParticipant;

        StudyParticipantFilter filter = new StudyParticipantFilter();
        filter.status = 'Open';
        filter.studyTitleTerm = 'Title';

        PaginationData paginationData = new PaginationData();
        SearchResponse response = SearchService.search(filter, paginationData);

        Test.stopTest();

        System.assert(response.paginationData.currentPageCount == 1, 'wrong records count per count page');
        System.assert(response.pageRecords.size() == 1, 'wrong records count per count page');
    }
}