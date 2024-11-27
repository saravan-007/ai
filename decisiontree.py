from sklearn.datasets import load_iris
from sklearn.tree import DecisionTreeClassifier, export_text
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

def main():
    # Step 1: Load the dataset
    iris = load_iris()
    X = iris.data  # Features
    y = iris.target  # Target labels

    # Step 2: Split the dataset
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Step 3: Train the Decision Tree Classifier
    clf = DecisionTreeClassifier(criterion='gini', max_depth=3, random_state=42)
    clf.fit(X_train, y_train)

    # Step 4: Predict on test data
    y_pred = clf.predict(X_test)

    # Step 5: Evaluate the model
    accuracy = accuracy_score(y_test, y_pred)
    print("Accuracy of Decision Tree Classifier:", accuracy)

    # Display the decision tree rules
    tree_rules = export_text(clf, feature_names=iris.feature_names)
    print("\nDecision Tree Rules:\n", tree_rules)

if __name__ == "__main__":
    main()
