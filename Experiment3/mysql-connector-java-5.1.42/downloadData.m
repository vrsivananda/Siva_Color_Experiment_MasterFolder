%%%%%%%%%%%%%%%%
% Experiment 3 %
%%%%%%%%%%%%%%%%

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
    path='Expt3_Subjects.txt';
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
        
        name = fscanf(subjectListFid,'%s',[1 1]);
        fprintf('subject:  %s\n',name);
        %load([path name]);


        %First, get the periSat 0.3 and "p" answers.
        sqlquery1 = ['SELECT * FROM SivaExpt3 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = 0.3) AND (key_press = 80) AND internal_node_id LIKE "%12.0"'];
        curs1 = exec(conn,sqlquery1);
        setdbprefs('DataReturnFormat','cellarray');
        curs1 = fetch(curs1);
        %This will create a cell array with the dimensions of your SQL table.
        StimulusData1 = curs1.Data;
        
        %If the cell has indicates no data, then number is zero
        if(isequal(StimulusData1{1,1},'No Data'))
            background1 = 0;
        else
            %Grab the columns you want from the array and convert them to 1-D matrices.
            background1 = [StimulusData1{:,13}]'; % If the trial had a background (column 'background').
        end
        
        noBackground1 = sum(background1 == 0); %Number times hit "P" for noBackground condition 
        hasBackground1 = sum(background1 == 1); %Number times hit "P" for hasBackground condition
        
        
        
        sqlquery2 = ['SELECT * FROM SivaExpt3 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = 0.4) AND (key_press = 80) AND internal_node_id LIKE "%12.0"'];
        curs2 = exec(conn,sqlquery2);
        setdbprefs('DataReturnFormat','cellarray');
        curs2 = fetch(curs2);
        %This will create a cell array with the dimensions of your SQL table.
        StimulusData2 = curs2.Data;
        
        %If the cell has indicates no data, then number is zero
        if(isequal(StimulusData2{1,1},'No Data'))
            background2 = 0;
        else
            %Grab the columns you want from the array and convert them to 1-D matrices.
            background2 = [StimulusData2{:,13}]'; % If the trial had a background (column 'background').
        end
        
        noBackground2 = sum(background2 == 0); %Number times hit "P" for noBackground condition 
        hasBackground2 = sum(background2 == 1); %Number times hit "P" for hasBackground condition
        
        
        sqlquery3 = ['SELECT * FROM SivaExpt3 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = 0.5) AND (key_press = 80) AND internal_node_id LIKE "%12.0"'];
        curs3 = exec(conn,sqlquery3);
        setdbprefs('DataReturnFormat','cellarray');
        curs1 = fetch(curs3);
        %This will create a cell array with the dimensions of your SQL table.
        StimulusData3 = curs3.Data;


        %If the cell has indicates no data, then number is zero
        if(isequal(StimulusData3{1,1},'No Data'))
            background3 = 0;
        else
            %Grab the columns you want from the array and convert them to 1-D matrices.
            background3 = [StimulusData3{:,13}]'; % If the trial had a background (column 'background').
        end
        
        noBackground3 = sum(background3 == 0); %Number times hit "P" for noBackground condition 
        hasBackground3 = sum(background3 == 1); %Number times hit "P" for hasBackground condition
        
        
        
        sqlquery4 = ['SELECT * FROM SivaExpt3 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = 0.6) AND (key_press = 80) AND internal_node_id LIKE "%12.0"'];
        curs4 = exec(conn,sqlquery4);
        setdbprefs('DataReturnFormat','cellarray');
        curs4 = fetch(curs4);
        %This will create a cell array with the dimensions of your SQL table.
        StimulusData4 = curs4.Data;


        %If the cell has indicates no data, then number is zero
        if(isequal(StimulusData4{1,1},'No Data'))
            background4 = 0;
        else
            %Grab the columns you want from the array and convert them to 1-D matrices.
            background4 = [StimulusData4{:,13}]'; % If the trial had a background (column 'background').
        end
        
        noBackground4 = sum(background4 == 0); %Number times hit "P" for noBackground condition 
        hasBackground4 = sum(background4 == 1); %Number times hit "P" for hasBackground condition
        
        
        sqlquery5 = ['SELECT * FROM SivaExpt3 WHERE subject = "', name, '" AND (isResponseTrial = 1) AND (periSat = 0.7) AND (key_press = 80) AND internal_node_id LIKE "%12.0"'];
        curs5 = exec(conn,sqlquery5);
        setdbprefs('DataReturnFormat','cellarray');
        curs5 = fetch(curs5);
        %This will create a cell array with the dimensions of your SQL table.
        StimulusData5 = curs5.Data;


        %If the cell has indicates no data, then number is zero
        if(isequal(StimulusData5{1,1},'No Data'))
            background5 = 0;
        else
            %Grab the columns you want from the array and convert them to 1-D matrices.
            background5 = [StimulusData5{:,13}]'; % If the trial had a background (column 'background').
        end
        
        noBackground5 = sum(background5 == 0); %Number times hit "P" for noBackground condition 
        hasBackground5 = sum(background5 == 1); %Number times hit "P" for hasBackground condition
        
        %------------------------------------------------------------------------------------------
        
        %Analyze the functions before they are saved
        numberOfTrials = 20;
        x = [0.3, 0.4, 0.5, 0.6, 0.7];
        
        %-------------------------
        %Condition1 (flashes == 0)
        y1 = [noBackground1 noBackground2 noBackground3 noBackground4 noBackground5]./numberOfTrials;
        
        parameters1 = psychometricFit(x,y1,i,1,0);
        disp('Subject ' + string(i) + ' parameters: ');
        disp(parameters1);
        
        %Get the predicted y values for each x based on the parameters
        y_pred1 = cumulativeGaussian(x,parameters1);
        %Calculate the chisquared for the 
        chiSquared1 = chiSquared(y1,y_pred1);
        %Calculate the PSE
        pse1 = inverseCumulativeGaussian(parameters1, 0.5);
        
        
        %Store values in stores
        chi2Store1(1,i) = chiSquared1;
        parameterStore1(i,:) = parameters1;
        pseStore1(1,i) = pse1;
        yStore1(i,:) = y1;
        
        %-------------------------
        %Condition2 (flashes == 9)
        y2 = [hasBackground1 hasBackground2 hasBackground3 hasBackground4 hasBackground5]./numberOfTrials;
        
        parameters2 = psychometricFit(x,y2,i,2,0);
        disp('Subject ' + string(i) + ' parameters: ');
        disp(parameters2);
        
        %Get the predicted y values for each x based on the parameters
        y_pred2 = cumulativeGaussian(x,parameters2);
        %Calculate the chisquared for the 
        chiSquared2 = chiSquared(y2,y_pred2);
        %Calculate the PSE
        pse2 = inverseCumulativeGaussian(parameters2, 0.5);
        
        
        %Store values in stores
        chi2Store2(1,i) = chiSquared2;
        parameterStore2(i,:) = parameters2;
        pseStore2(1,i) = pse2;
        yStore2(i,:) = y2;
        
        %------------------------------------------------------------------------------------------
        
        %Create a new name to save the data as (.mat files)
        fname=[name '_data'];

        %Save the variables we created above.
        %Note that some will need to be re-coded/corrected in analyzeData.m
        save(fname,'x','y1');

    end %End of the for loop that loops through the participants
       
    % IMPORTANT: 
    %-----------
    %Omitting must be done from the last element to the first (reverse
    %order). If not, it will result in errors downstream and the wrong data
    %will be deleted!
    
    
     %Omit the 16th
     pseStore1(:,16) = [];
     pseStore2(:,16) = [];
     yStore1(16,:) = [];
     yStore2(16,:) = [];
     
     %Omit the 15th
     pseStore1(:,15) = [];
     pseStore2(:,15) = [];
     yStore1(15,:) = [];
     yStore2(15,:) = [];
     
     %Omit the 13th
     pseStore1(:,13) = [];
     pseStore2(:,13) = [];
     yStore1(13,:) = [];
     yStore2(13,:) = [];
     
     %Omit the 9th
     pseStore1(:,9) = [];
     pseStore2(:,9) = [];
     yStore1(9,:) = [];
     yStore2(9,:) = [];
    
    
    %Analysis over all the subjects
    %Condition 1
    yMean1 = mean(yStore1,'omitnan');
    yStd1 = std(yStore1,'omitnan');
    parameters1 = psychometricFit(x,yMean1,['Average (n = ' num2str(length(pseStore1)) ')'],1,1);
    errorbar(x,yMean1,yStd1);
    legend('Average Data','Model Fit','Location','northwest');
    
    %Condition 2
    yMean2 = mean(yStore2,'omitnan');
    yStd2 = std(yStore2,'omitnan');
    parameters2 = psychometricFit(x,yMean2,['Average (n = ' num2str(length(pseStore2)) ')'],2,1);
    errorbar(x,yMean2,yStd2);
    legend('Average Data','Model Fit','Location','northwest');
    
    
    
    disp('Final analysis:');
    disp('Condition 1:');
    pse1 = inverseCumulativeGaussian(parameters1, 0.5)
    y_pred1 = cumulativeGaussian(x,parameters1)
    chiSquared1 = chiSquared(yMean1,y_pred1)
    
    disp('Condition 2:');
    pse2 = inverseCumulativeGaussian(parameters2, 0.5)
    y_pred2 = cumulativeGaussian(x,parameters2)
    chiSquared2 = chiSquared(yMean2,y_pred2)
    
    %Test if PSE is different from each other
    [h, p, ci, stats] = ttest(pseStore1, pseStore2)

fclose(subjectListFid);
%end
