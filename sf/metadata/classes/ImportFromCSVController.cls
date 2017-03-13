global class ImportFromCSVController {
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<Student__c> studentList{get;set;}
    
    public ImportFromCSVController(){
        csvFileLines = new String[]{};
        studentList = New List<Student__c>(); 
    }
  
    public void importCSVFile(){
        try{
            csvAsString = 'firstName,lastName,age,acc_id\nAbi,Showkath,23,0016F00001sXmtyQAC';
            csvFileLines = csvAsString.split('\n'); 
            
            for(Integer i=1;i<csvFileLines.size();i++){
                Student__c studObj = new Student__c() ;
                string[] csvRecordData = csvFileLines[i].split(',');
                studObj.first_Name__c = csvRecordData[0] ;             
                studObj.last_Name__c = csvRecordData[1];
                studObj.age__c = Integer.valueOf(csvRecordData[2]);
                studObj.Account__c = [select id from Account where id=:csvRecordData[3]].id;   
                studentList.add(studObj);   
            }
            DataProcessBatchClass processObj = new DataProcessBatchClass(studentList);
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
    }
}