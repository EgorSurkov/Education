/**
 * Created by Surkov Egor on 05.09.2019.
 */

public with sharing class PaginationData {
    @AuraEnabled public Integer allRecordsCount;
    @AuraEnabled public Integer pagesCount;
    @AuraEnabled public Integer pageRecordCount;
    @AuraEnabled public Integer currentPage;
    @AuraEnabled public Integer currentPageCount;
    @AuraEnabled public Integer offSet;
    @AuraEnabled  public Integer endOffSet;

    public PaginationData(){
        currentPage = 1;
        pageRecordCount = 5;
    }

    public void setRecordsCount(Integer allRecordsCount) {
        this.allRecordsCount = allRecordsCount;
        recalc();
    }
    public void recalc(){
        Decimal  allRecordsCountDecimal = allRecordsCount;
        Decimal  pageRecordCountDecimal = pageRecordCount;
        Decimal  allPagesDecimal = allRecordsCountDecimal / pageRecordCountDecimal;
        allPagesDecimal = allPagesDecimal.round(System.RoundingMode.UP);
        pagesCount = allPagesDecimal == 0 ? 1 : allPagesDecimal.intValue();
        if(currentPage > pagesCount) currentPage = pagesCount;
        offSet = (currentPage - 1) * pageRecordCount;
        endOffSet = offSet + pageRecordCount;

        if(endOffSet > allRecordsCount) endOffSet = allRecordsCount;
        currentPageCount = endOffSet - offSet;

    }
}