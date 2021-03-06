% p(1) = alpha  = bias / mean / threshold / PSE
% p(2) = beta   = slope
% p(3) = gamma  = guess rate
% p(4) = lambda = lapse rate

function output = psychometricFit(x,y,subjNum,save)
    %hold the previous figure
    figure;

    %psyFit = @(p,a) 0.5*(erfc((a-p(1))/(p(2)*sqrt(2))));
    %   y  =     gamma+(1-gamma-lambda)*0.5*erfc(-beta.*(x-alpha)./sqrt(2));
    psyFit = @(p,a) p(3)+(1-p(3)-p(4))*0.5*(erfc((-p(2)).*(a-p(1))./sqrt(2)));
    
    %Get an estimate of the parameters from the function and guess valuese
    pEst = nlinfit(x,y,psyFit,[0.5, 1, 0, 1]);
    %Createdetailed points of x for smooth sigmoid curve
    newX = linspace(x(1),x(end),40);
    %Make an long array of estimated y values based on the parameters above
    y_pred = psyFit(pEst,newX);
    
    %Plot the original values with large blue dots
    plot(x,y,'b.','MarkerSize',20);
    %label and title the plot
    ylabel("Proportion Chosen Saturation Periphery > Center");
    xlabel("Saturation in Periphery");
    title("Subject " + subjNum);
    xlim([0.2 0.8]);
    ylim([0 1]);
    
    
    %Hold so that another plot can go over the same figure
    hold on;
    %Plot the predicted values based on the psychometric function
    plot(newX,y_pred,'r.--','LineWidth',2,'MarkerSize',1);
    %Add the legend
    legend('Data','Model Fit','Location','northwest');
    
    %Save the figure
    if(save == 1)
        fileName = ['Expt1_Subject' num2str(subjNum) '.png'];
        saveas(gcf,fileName);
    end
    
    %Output the bias and slope (the parameters)
    output = pEst;
end
