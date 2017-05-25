%function downloadData(sub)
    clear;
    close all;
    

    % Created by Brian Odegaard on 03/16/16
    % Updated for this directory and project on 08/25/16

    % Goal: Connect to the database that you want to use and download data.
    % Also note: you need the jar file in the working directory . . .

    % Pipeline: 
    % (1) Run "downloadData.m" to get data from the SQL database
    % You will need a list of the subject ID's (.txt) for input.
    % List is currently saved as 'sligteexp1subs.txt'
    % (2) Run "analyzeData.m" to format data properly and run Brian 
    % Maniscalco's d' files, which need to be in the directory.  
    % You will need a list of the subject_data .mat files.
    % List is currently saved as 'sligteexp1subsdata.txt'
    % (3) Run "results4mastertable.m" to create a master matrix (and plot?)
    % You will need a list of the subject_data_analysis .mat files.
    % List is currently saved as 'sligteexp1subsdataanalysis.txt'


    %First, add the java file that you'll need to connect
    %(This needs to be in the same directory or have the path added)
    %Get this file from the Oracle website if you don't have it otherwise.
    javaaddpath('mysql-connector-java-5.1.42-bin.jar');


    %Next, create a connection object by connecting to our SQL database.
    conn = database('psych_qualia','qualia_01','Bgt5kn|e','Vendor','MySQL',...
    'Server','psiturk.psych.ucla.edu');


    %Then, load a text file that lists all of the subjects.
    path='Expt1_Subjects.txt';
    subjectListFid=fopen(path);
    tot = fscanf(subjectListFid,'%d');
    
    %Create stores to store values for all subjects
    %chi2Store = nan(1,tot);
   % parameterStore = nan(tot,4);
   % pseStore = nan(1,tot);
   % yStore = nan(tot,5);
   
   %Counter to count the actual subjects whose data gets processed
   %i = 0;


    %Loop through e'erbody and get the data you need.
    for i = 1:tot
        %Skip if any of these discarded subjects
%          if (i == 2 || i == 6 || i == 8 || i == 11 || i == 12)
%             continue;
%          end
%         i = i + 1;
        
        name = fscanf(subjectListFid,'%s',[1 1]);
        fprintf('subject:  %s\n',name);
        %load([path name]);


        %First, get the periSat 0.3 and "p" answers.
        sqlquery1 = ['SELECT * FROM SivaExpt1 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = "0.3") AND key_press = 80 AND internal_node_id LIKE "%2.0"'];
        curs1 = exec(conn,sqlquery1);
        setdbprefs('DataReturnFormat','cellarray');
        curs1 = fetch(curs1);
        %This will create a cell array with the dimensions of your SQL table.
        %As of now, this should have 180 trials
        StimulusData1 = curs1.Data;


        %Grab the columns you want from the array and convert them to 1-D matrices.
        keyPress1 = [StimulusData1{:,4}]'; %keyPress: Which key they pressed.
        periSat1 = [StimulusData1{:,11}]'; %periSat: The saturation in the periphery.
        
        
        
        sqlquery2 = ['SELECT * FROM SivaExpt1 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = "0.4") AND (key_press = 80) AND internal_node_id LIKE "%2.0"'];
        curs2 = exec(conn,sqlquery2);
        setdbprefs('DataReturnFormat','cellarray');
        curs2 = fetch(curs2);
        %This will create a cell array with the dimensions of your SQL table.
        %As of now, this should have 180 trials
        StimulusData2 = curs2.Data;


        %Grab the columns you want from the array and convert them to 1-D matrices.
        keyPress2 = [StimulusData2{:,4}]'; %keyPress: Which key they pressed.
        periSat2 = [StimulusData2{:,11}]'; %periSat: The saturation in the periphery.
        
        
        sqlquery3 = ['SELECT * FROM SivaExpt1 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = "0.5") AND key_press = 80 AND internal_node_id LIKE "%2.0"'];
        curs3 = exec(conn,sqlquery3);
        setdbprefs('DataReturnFormat','cellarray');
        curs1 = fetch(curs3);
        %This will create a cell array with the dimensions of your SQL table.
        %As of now, this should have 180 trials
        StimulusData3 = curs3.Data;


        %Grab the columns you want from the array and convert them to 1-D matrices.
        keyPress3 = [StimulusData3{:,4}]'; %keyPress: Which key they pressed.
        periSat3 = [StimulusData3{:,11}]'; %periSat: The saturation in the periphery.
        
        
        sqlquery4 = ['SELECT * FROM SivaExpt1 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = "0.6") AND key_press = 80 AND internal_node_id LIKE "%2.0"'];
        curs4 = exec(conn,sqlquery4);
        setdbprefs('DataReturnFormat','cellarray');
        curs4 = fetch(curs4);
        %This will create a cell array with the dimensions of your SQL table.
        %As of now, this should have 180 trials
        StimulusData4 = curs4.Data;


        %Grab the columns you want from the array and convert them to 1-D matrices.
        keyPress4 = [StimulusData4{:,4}]'; %keyPress: Which key they pressed.
        periSat4 = [StimulusData4{:,11}]'; %periSat: The saturation in the periphery.
        
        
        sqlquery5 = ['SELECT * FROM SivaExpt1 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = "0.7") AND key_press = 80 AND internal_node_id LIKE "%2.0"'];
        curs5 = exec(conn,sqlquery5);
        setdbprefs('DataReturnFormat','cellarray');
        curs5 = fetch(curs5);
        %This will create a cell array with the dimensions of your SQL table.
        %As of now, this should have 180 trials
        StimulusData5 = curs5.Data;


        %Grab the columns you want from the array and convert them to 1-D matrices.
        keyPress5 = [StimulusData5{:,4}]'; %keyPress: Which key they pressed.
        periSat5 = [StimulusData5{:,11}]'; %periSat: The saturation in the periphery.
        
        %Analyze the functions before they are saved
        numberOfTrials = 40;
        y = [length(keyPress1),length(keyPress2),length(keyPress3),length(keyPress4),length(keyPress5)]./numberOfTrials
        x = [0.3, 0.4, 0.5, 0.6, 0.7];
        parameters = psychometricFit(x,y,i,0);
        disp('Subject ' + string(i) + ' parameters: ');
        disp(parameters);
        
        %Get the predicted y values for each x based on the parameters
        y_pred = cumulativeGaussian(x,parameters)
        %Calculate the chisquared for the 
        chi2 = chiSquared(y,y_pred)
        %Calculate the PSE
        pse = inverseCumulativeGaussian(parameters, 0.5);
        
        
        %Store values in stores
        chi2Store(1,i) = chi2;
        parameterStore(i,:) = parameters;
        pseStore(1,i) = pse;
        yStore(i,:) = y;
        
        %Create a new name to save the data as (.mat files)
        fname=[name '_data'];

        %Save the variables we created above.
        %Note that some will need to be re-coded/corrected in analyzeData.m
        save(fname,'x','y','keyPress1','periSat1','keyPress2','periSat2','keyPress3','periSat3','keyPress4','periSat4','keyPress5','periSat5');

    end
    
    
    %Analysis over all the subjects
    figure;
    yMean = mean(yStore,'omitnan');
    yStd = std(yStore,'omitnan');
    parameters = psychometricFit(x,yMean,['Average (n = ' num2str(7) ')'],0);
    errorbar(x,yMean,yStd);
    legend('Average Data','Model Fit','Location','northwest');
    
    
    disp('Final analysis');
    pse = inverseCumulativeGaussian(parameters, 0.5)
    y_pred = cumulativeGaussian(x,parameters)
    chi2 = chiSquared(yMean,y_pred)
    
    %Test if PSE is different from zero
    [h, p, ci, stats] = ttest(pseStore, 0.5)

fclose(subjectListFid);
%end
