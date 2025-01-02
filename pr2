#include<iostream>
#include<unordered_map>
#include<unordered_set>
#include<vector>
#include<string>

using namespace std;


bool isValid(int noOfSymbol, const string& inputSymbols, int noOfState, int initialState, 
             const unordered_set<int>& acceptingStates, const string& inputString) {
    
    unordered_map<int, unordered_map<char, int>> transitionTable;

    for (int i = 1; i <= noOfState; i++) {
        cout << "Present State : '" << i << "'" << endl;

        for (char ch : inputSymbols) {
            int nextState;
            cout << "Enter the next state for input symbol '" << ch << "': ";
            cin >> nextState;
            transitionTable[i][ch] = nextState;
        }
    }
    
    int currentState = initialState;
    for (char ch : inputString) {
        if (transitionTable[currentState].find(ch) != transitionTable[currentState].end()) {
            currentState = transitionTable[currentState][ch];
        } else {
            return false;
        }
    }
    
    return acceptingStates.find(currentState) != acceptingStates.end();
}

int main(){
    int nSymbol,nState,iniState,nAccect;
    string inputString,inputSymbol;
    unordered_set<int> acceptingState;

    cout<<"Enter no of symbol:";
    cin>>nSymbol;
    cout << "Enter input symbols: ";
    cin>>inputSymbol;
    cout << "Enter number of states: ";
    cin>>nState;
    cout << "Enter initial state: ";
    cin>>iniState;
    cout << "Enter number of accepting states: ";
    cin>>nAccect;

    cout << "Enter accepting states: ";

    for (int i = 0; i < nAccect; i++)
    {
        int state;
        cin>>state;
        acceptingState.insert(state);
    }

    cout << "Enter input string: ";
    cin >> inputString;

    if (isValid(nSymbol, inputSymbol, nState, iniState, acceptingState, inputString)) {
        cout << "The input string is valid." << endl;
    } else {
        cout << "The input string is invalid." << endl;
    }

    return 0;
    
}
